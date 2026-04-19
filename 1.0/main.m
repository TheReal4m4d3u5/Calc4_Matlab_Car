clear;
clc;
close all;

pause on

% ---------------- VIEW ----------------
b = -50;
c = 70;
d = 270;

wxmin = -90;
wxmax = 90;
wymin = -40;
wymax = 35;

pse = 0.01;

% ---------------- CAR MODEL ----------------
dCar = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -0.75 -0.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
         0    0    2.5  2.5  2.5  2.5   4     4    4    4    2.5  2.5  2.5  2.5  0    0;
        -2.5  2.5  2.5 -2.5 -2.5  2.5  -2.5  2.5 -2.5  2.5 -2.5  2.5 -2.5  2.5  2.5 -2.5;
         1    1    1    1    1    1     1     1    1    1    1    1    1    1    1    1];

Acar = [0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1;
        1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0;
        0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0;
        1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0;
        0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0;
        0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0;
        0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0;
        0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0;
        0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0;
        0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0;
        0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0;
        0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1;
        0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0;
        0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
        1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0];

% Push car slightly back so it sits better in scene
Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 -15;
        0 0 0 1] * dCar;

% ---------------- BUILDING MODEL ----------------
height = 10;
dBuild = [-10 10 10 -10 -10 10 10 -10;
            0  0  0   0  height height height height;
          -10 -10 10  10 -10 -10 10 10;
            1  1  1   1   1      1      1      1];

Abuild = [0 1 0 1 1 0 0 0;
          1 0 1 0 0 1 0 0;
          0 1 0 1 0 0 1 0;
          1 0 1 0 0 0 0 1;
          1 0 0 0 0 1 0 1;
          0 1 0 0 1 0 1 0;
          0 0 1 0 0 1 0 1;
          0 0 0 1 1 0 1 0];

% 3x3 buildings
bx = [-40 0 40];
bz = [40 0 -40];

Buildings = cell(1, 9);
k = 1;
for i = 1:length(bx)
    for j = 1:length(bz)
        Buildings{k} = [1 0 0 bx(i);
                        0 1 0 0;
                        0 0 1 bz(j);
                        0 0 0 1] * dBuild;
        k = k + 1;
    end
end

% ---------------- PROJECTION ----------------
P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0    0;
     0 0 -1/d 1];

% ---------------- ROAD / MOTION SETTINGS ----------------
segmentLen = 40;     % straight segment length
turnRadius = 20;     % quarter-turn radius
boundMin = -60;
boundMax =  60;

% Start at lower-left road point, facing east
pos = [-60; 60];     % [x; z]
heading = 0;         % 0=east, 1=north, 2=west, 3=south

numMoves = 80;

figure('Color','w');

for moveNum = 1:numMoves

    actions = validActions(pos, heading, segmentLen, turnRadius, boundMin, boundMax);

    if isempty(actions)
        break;
    end

    choice = actions{randi(length(actions))};

    switch choice
        case 'straight'
            [posNew, headingNew] = animateStraight( ...
                pos, heading, segmentLen, ...
                Car0, Buildings, Acar, Abuild, ...
                P, wxmin, wxmax, wymin, wymax, pse);

        case 'left'
            [posNew, headingNew] = animateTurn( ...
                pos, heading, +1, turnRadius, ...
                Car0, Buildings, Acar, Abuild, ...
                P, wxmin, wxmax, wymin, wymax, pse);

        case 'right'
            [posNew, headingNew] = animateTurn( ...
                pos, heading, -1, turnRadius, ...
                Car0, Buildings, Acar, Abuild, ...
                P, wxmin, wxmax, wymin, wymax, pse);
    end

    pos = posNew;
    heading = headingNew;

    fprintf('Move %d: %s   x=%.2f   z=%.2f   heading=%d\n', ...
        moveNum, choice, pos(1), pos(2), heading);
end

pause off


% =========================================================
% LOCAL FUNCTIONS
% =========================================================

function actions = validActions(pos, heading, segmentLen, turnRadius, boundMin, boundMax)

actions = {};

% straight
pStraight = pos + segmentLen * headingVec(heading);
if inBounds(pStraight, boundMin, boundMax)
    actions{end+1} = 'straight';
end

% left
[pLeft, ~] = turnEndState(pos, heading, +1, turnRadius);
if inBounds(pLeft, boundMin, boundMax)
    actions{end+1} = 'left';
end

% right
[pRight, ~] = turnEndState(pos, heading, -1, turnRadius);
if inBounds(pRight, boundMin, boundMax)
    actions{end+1} = 'right';
end

end


function tf = inBounds(p, boundMin, boundMax)
tf = p(1) >= boundMin && p(1) <= boundMax && ...
     p(2) >= boundMin && p(2) <= boundMax;
end


function v = headingVec(heading)
% 0=east, 1=north, 2=west, 3=south
switch heading
    case 0
        v = [1; 0];
    case 1
        v = [0; 1];
    case 2
        v = [-1; 0];
    case 3
        v = [0; -1];
end
end


function ang = headingAngle(heading)
% angle in x-z plane for the rotation matrix
switch heading
    case 0
        ang = 0;
    case 1
        ang = pi/2;
    case 2
        ang = pi;
    case 3
        ang = -pi/2;
end
end


function [posNew, headingNew] = animateStraight( ...
    pos, heading, segmentLen, ...
    Car0, Buildings, Acar, Abuild, ...
    P, wxmin, wxmax, wymin, wymax, pse)

u = headingVec(heading);
ang = headingAngle(heading);

frames = 18;

for i = 0:frames
    t = i / frames;
    p = pos + t * segmentLen * u;

    Car = transformCar(Car0, p(1), p(2), ang);
    drawScene(Car, Buildings, Acar, Abuild, P, wxmin, wxmax, wymin, wymax);
    pause(pse);
end

posNew = pos + segmentLen * u;
headingNew = heading;
end


function [posNew, headingNew] = animateTurn( ...
    pos, heading, turnDir, turnRadius, ...
    Car0, Buildings, Acar, Abuild, ...
    P, wxmin, wxmax, wymin, wymax, pse)

% turnDir = +1 for left, -1 for right

u = headingVec(heading);        % forward
leftNormal = [-u(2); u(1)];

if turnDir == 1
    center = pos + turnRadius * leftNormal;
    delta = +1;
else
    center = pos - turnRadius * leftNormal;
    delta = -1;
end

r0 = pos - center;              % radius vector from center to start point
ang0 = headingAngle(heading);

frames = 18;

for i = 0:frames
    t = i / frames;
    theta = delta * (pi/2) * t;

    R2 = [cos(theta) -sin(theta);
          sin(theta)  cos(theta)];

    p = center + R2 * r0;
    ang = ang0 + theta;

    Car = transformCar(Car0, p(1), p(2), ang);
    drawScene(Car, Buildings, Acar, Abuild, P, wxmin, wxmax, wymin, wymax);
    pause(pse);
end

thetaFinal = delta * (pi/2);
R2f = [cos(thetaFinal) -sin(thetaFinal);
       sin(thetaFinal)  cos(thetaFinal)];

posNew = center + R2f * r0;
headingNew = mod(heading + turnDir, 4);

end


function [posNew, headingNew] = turnEndState(pos, heading, turnDir, turnRadius)

u = headingVec(heading);
leftNormal = [-u(2); u(1)];

if turnDir == 1
    center = pos + turnRadius * leftNormal;
    delta = +1;
else
    center = pos - turnRadius * leftNormal;
    delta = -1;
end

r0 = pos - center;

thetaFinal = delta * (pi/2);
R2f = [cos(thetaFinal) -sin(thetaFinal);
       sin(thetaFinal)  cos(thetaFinal)];

posNew = center + R2f * r0;
headingNew = mod(heading + turnDir, 4);

end


function Car = transformCar(Car0, tx, tz, ang)

T = [1 0 0 tx;
     0 1 0 0;
     0 0 1 tz;
     0 0 0 1];

Ry = [ cos(ang) 0 -sin(ang) 0;
       0        1  0        0;
       sin(ang) 0  cos(ang) 0;
       0        0  0        1];

Car = T * Ry * Car0;
end


function drawScene(Car, Buildings, Acar, Abuild, P, wxmin, wxmax, wymin, wymax)

cla;
hold on;

% buildings
for k = 1:length(Buildings)
    B = Buildings{k};
    pts2 = projectPoints(B, P);
    gplot(Abuild, pts2, 'k');
end

% car
ptsCar = projectPoints(Car, P);
gplot(Acar, ptsCar, 'b');

axis([wxmin wxmax wymin wymax]);
axis manual;
axis equal;
drawnow;
hold off;

end


function pts2 = projectPoints(DP, P)

Dpro = P * DP;
w = Dpro(4,:);
GP = Dpro(1:3,:) ./ [w; w; w];
pts2 = GP(1:2,:)';

end