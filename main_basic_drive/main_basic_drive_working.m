clear;
clc;
close all;

pause on

% ==========================================================
% VIEW / CAMERA
% ==========================================================
b = -30;
c = 30;
d = 70;

wxmin = -80;
wxmax = 80;
wymin = -40;
wymax = 40;

pse = 0.03;

% ==========================================================
% MOTION SETTINGS
% ==========================================================
numMoves = 30;
turnFrames = 28;        % more frames = smoother turns
moveFramesBase = 18;
turnTension = 0.65;     % tangent length factor for curved turns

% ==========================================================
% CAR DATA
% ==========================================================
dCar = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -0.75 -0.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
         0    0    2.5  2.5  2.5  2.5   4     4    4    4    2.5  2.5  2.5  2.5  0    0;
        -2.5  2.5  2.5 -2.5 -2.5  2.5  -2.5   2.5 -2.5  2.5 -2.5  2.5 -2.5  2.5  2.5 -2.5;
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

Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 1;
        0 0 0 1] * dCar;

% one-time car orientation fix so front faces forward
Rfix = [cos(pi)  0 -sin(pi) 0;
        0        1 0        0;
        sin(pi)  0 cos(pi)  0;
        0        0 0        1];

Car0 = Rfix * Car0;

% ==========================================================
% BUILDING DATA
% ==========================================================
dBuilding = [-10 -10 -10 -10  10  10  10  10;
              0   20   0  20   0  20   0  20;
            -10 -10  10  10 -10 -10  10  10;
              1   1   1   1   1   1   1   1];

Abuild = [0 1 1 0 1 0 0 0;
          1 0 0 1 0 1 0 0;
          1 0 0 1 0 0 1 0;
          0 1 1 0 0 0 0 1;
          1 0 0 0 0 1 1 0;
          0 1 0 0 1 0 0 1;
          0 0 1 0 1 0 0 1;
          0 0 0 1 0 1 1 0];

% ==========================================================
% 3x3 BUILDING GRID
% ==========================================================
xPositions = [35 75 115];
zPositions = [-20 -60 -120];

numBuildings = length(xPositions) * length(zPositions);
BaseBuildings = cell(1, numBuildings);

k = 1;
for i = 1:length(xPositions)
    for j = 1:length(zPositions)
        BaseBuildings{k} = [1 0 0 xPositions(i);
                            0 1 0 0;
                            0 0 1 zPositions(j);
                            0 0 0 1] * dBuilding;
        k = k + 1;
    end
end

% ==========================================================
% ROAD GRID
% ==========================================================
roadX = [0 35 75 115];
roadZ = [0 -35 -75 -120];

% start at upper-left intersection facing east
row = 1;
col = 1;
heading = 'E';

% use "shift space" for motion, since world moves around the car
sx = roadX(col);
sz = -roadZ(row);

y = headingToYaw(heading);

Car = getCarTransform(Car0, 0, 0, y);
Buildings = shiftWorld(BaseBuildings, -sx, -sz);
drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
    wxmin, wxmax, wymin, wymax);
pause(0.5);

% ==========================================================
% RANDOM DRIVE
% ==========================================================
for moveNum = 1:numMoves

    [actions, nextHeadings] = getValidActions(row, col, heading);

    actionIdx = randi(length(actions));
    action = actions{actionIdx};
    newHeading = nextHeadings{actionIdx};

    oldRow = row;
    oldCol = col;
    oldSx = roadX(oldCol);
    oldSz = -roadZ(oldRow);

    [row, col] = moveForward(oldRow, oldCol, newHeading);

    newSx = roadX(col);
    newSz = -roadZ(row);

    fprintf('Move %d: %s   heading=%s   row=%d col=%d   sx=%.2f sz=%.2f\n', ...
        moveNum, action, newHeading, row, col, newSx, newSz);

    p0 = [oldSx; oldSz];
    p1 = [newSx; newSz];

    moveDistance = norm(p1 - p0);
    baseDistance = 35;
    moveFrames = max(12, round(moveFramesBase * moveDistance / baseDistance));

    if strcmp(action, 'straight')
        moveFrames = max(moveFrames, 16);

        for f = 1:moveFrames
            t = f / moveFrames;
            a = smoothstep(t);

            p = (1 - a) * p0 + a * p1;
            dp = p1 - p0;

            yInterp = vecToYaw(dp(1), dp(2));

            Car = getCarTransform(Car0, 0, 0, yInterp);
            Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

            drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
                wxmin, wxmax, wymin, wymax);

            pause(pse);
        end
    else
        moveFrames = max(moveFrames, turnFrames);

        dir0 = headingVector(heading);
        dir1 = headingVector(newHeading);

        tangentLen = turnTension * moveDistance;
        m0 = tangentLen * dir0;
        m1 = tangentLen * dir1;

        for f = 1:moveFrames
            t = f / moveFrames;
            a = smoothstep(t);

            p = hermitePoint(p0, p1, m0, m1, a);
            dp = hermiteTangent(p0, p1, m0, m1, a);

            yInterp = vecToYaw(dp(1), dp(2));

            Car = getCarTransform(Car0, 0, 0, yInterp);
            Buildings = shiftWorld(BaseBuildings, -p(1), -p(2));

            drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
                wxmin, wxmax, wymin, wymax);

            pause(pse);
        end
    end

    heading = newHeading;
end

pause off

% ==========================================================
function Car = getCarTransform(Car0, tx, tz, y)
    T = [1 0 0 tx;
         0 1 0 0;
         0 0 1 tz;
         0 0 0 1];

    Ry = [cos(y) 0  sin(y) 0;
          0      1  0      0;
         -sin(y) 0  cos(y) 0;
          0      0  0      1];

    Car = T * Ry * Car0;
end

function shiftedBuildings = shiftWorld(buildings, dx, dz)
    shiftedBuildings = cell(size(buildings));

    T = [1 0 0 dx;
         0 1 0 0;
         0 0 1 dz;
         0 0 0 1];

    for n = 1:length(buildings)
        shiftedBuildings{n} = T * buildings{n};
    end
end

function y = headingToYaw(heading)
    switch heading
        case 'E'
            y = 0;
        case 'W'
            y = pi;
        case 'N'
            y = pi/2;
        case 'S'
            y = -pi/2;
    end
end

function v = headingVector(heading)
    switch heading
        case 'E'
            v = [1; 0];
        case 'W'
            v = [-1; 0];
        case 'N'
            v = [0; -1];
        case 'S'
            v = [0; 1];
    end
end

function y = vecToYaw(dx, dz)
    y = atan2(-dz, dx);
end

function [actions, nextHeadings] = getValidActions(row, col, heading)
    actions = {};
    nextHeadings = {};

    straightHeading = heading;
    leftHeading = turnLeft(heading);
    rightHeading = turnRight(heading);

    if canMove(row, col, straightHeading)
        actions{end+1} = 'straight';
        nextHeadings{end+1} = straightHeading;
    end

    if canMove(row, col, leftHeading)
        actions{end+1} = 'left';
        nextHeadings{end+1} = leftHeading;
    end

    if canMove(row, col, rightHeading)
        actions{end+1} = 'right';
        nextHeadings{end+1} = rightHeading;
    end
end

function tf = canMove(row, col, heading)
    switch heading
        case 'E'
            tf = col < 4;
        case 'W'
            tf = col > 1;
        case 'N'
            tf = row > 1;
        case 'S'
            tf = row < 4;
        otherwise
            tf = false;
    end
end

function [newRow, newCol] = moveForward(row, col, heading)
    newRow = row;
    newCol = col;

    switch heading
        case 'E'
            newCol = col + 1;
        case 'W'
            newCol = col - 1;
        case 'N'
            newRow = row - 1;
        case 'S'
            newRow = row + 1;
    end
end

function newHeading = turnLeft(heading)
    switch heading
        case 'E'
            newHeading = 'N';
        case 'N'
            newHeading = 'W';
        case 'W'
            newHeading = 'S';
        case 'S'
            newHeading = 'E';
    end
end

function newHeading = turnRight(heading)
    switch heading
        case 'E'
            newHeading = 'S';
        case 'S'
            newHeading = 'W';
        case 'W'
            newHeading = 'N';
        case 'N'
            newHeading = 'E';
    end
end

function s = smoothstep(t)
    s = t * t * (3 - 2 * t);
end

function p = hermitePoint(p0, p1, m0, m1, t)
    h00 =  2*t^3 - 3*t^2 + 1;
    h10 =      t^3 - 2*t^2 + t;
    h01 = -2*t^3 + 3*t^2;
    h11 =      t^3 - t^2;

    p = h00 * p0 + h10 * m0 + h01 * p1 + h11 * m1;
end

function dp = hermiteTangent(p0, p1, m0, m1, t)
    h00d =  6*t^2 - 6*t;
    h10d =  3*t^2 - 4*t + 1;
    h01d = -6*t^2 + 6*t;
    h11d =  3*t^2 - 2*t;

    dp = h00d * p0 + h10d * m0 + h01d * p1 + h11d * m1;
end

function drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax)

    clf;
    set(gca, 'Color', [0 0 0]);
    hold on;

    for n = 1:length(Buildings)
        projectShape(Buildings{n}, Abuild, b, c, d, 'b-');
    end

    projectShape(Car, Acar, b, c, d, 'w-');
    set(findobj(gca, 'Type', 'line'), 'LineWidth', 1.5);

    axis([wxmin wxmax wymin wymax]);
    axis equal;
    drawnow;
end

function projectShape(D, A, b, c, d, lineSpec)
    P = [1 0 -b/d 0;
         0 1 -c/d 0;
         0 0 0    0;
         0 0 -1/d 1];

    Dpro = P * D;
    w = Dpro(4,:);

    if any(w <= 0.15)
        return;
    end

    GP = Dpro(1:3,:) ./ [w; w; w];
    G2 = transpose(GP(1:2,:));

    gplot(A, G2, lineSpec);
end