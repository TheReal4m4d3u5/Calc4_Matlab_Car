clear;
clc;
close all;

pause on

b = -30;
c = 30;
d = 100;

wxmin = -80;
wxmax = 80;
wymin = -40;
wymax = 40;

pse = 0.05;
turnFrames = 10;
moveFramesBase = 20;
numMoves = 60;

[dCar, Acar] = carData();
[dBuilding, Abuild] = buildingData();

Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 -20;
        0 0 0 1] * dCar;

% ---------- BUILDINGS ----------
buildingX = [35 75 115];
buildingZ = [-20 -60 -100];

numBuildings = length(buildingX) * length(buildingZ);
BaseBuildings = cell(1, numBuildings);

k = 1;
for i = 1:length(buildingX)
    for j = 1:length(buildingZ)
        BaseBuildings{k} = [1 0 0 buildingX(i);
                            0 1 0 0;
                            0 0 1 buildingZ(j);
                            0 0 0 1] * dBuilding;
        k = k + 1;
    end
end

% ---------- ROAD GRID ----------
roadX = [20 55 90 125];
roadZ = [-5 -35 -65 -75];

figure

% ---------- START STATE ----------
col = 2;
row = 2;

heading = 'E';

tx = roadX(col);
tz = roadZ(row);
y = headingToYaw(heading);

Car = getCarTransform(Car0, 0, 0, y);
Buildings = shiftWorld(BaseBuildings, -tx, -tz);
drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
    wxmin, wxmax, wymin, wymax);
pause(0.5)

% ---------- RANDOM DRIVE ----------
for moveNum = 1:numMoves

    [actions, nextHeadings] = getValidActions(row, col, heading);

    actionIdx = randi(length(actions));
    action = actions{actionIdx};
    newHeading = nextHeadings{actionIdx};

    oldRow = row;
    oldCol = col;
    oldTx = roadX(oldCol);
    oldTz = roadZ(oldRow);
    oldY = headingToYaw(heading);

    [row, col] = moveForward(oldRow, oldCol, newHeading);

    newTx = roadX(col);
    newTz = roadZ(row);
    newY = headingToYaw(newHeading);

    fprintf('Move %d: %s   heading=%s   row=%d col=%d   tx=%.2f tz=%.2f\n', ...
        moveNum, action, newHeading, row, col, newTx, newTz);



    % ---------- TURN FIRST ----------
    angleDiff = newY - oldY;



    % force shortest rotation manually
    if angleDiff > pi
        angleDiff = angleDiff - 2*pi;
    elseif angleDiff < -pi
        angleDiff = angleDiff + 2*pi;
    end
 


        if strcmp(action, 'right')
           angleDiff = -angleDiff
        end


if abs(angleDiff) > 1e-10
    for f = 1:turnFrames
        alpha = f / turnFrames;

        if strcmp(action, 'right')
            yInterp = oldY - alpha * angleDiff;
        else
            yInterp = oldY + alpha * angleDiff;
        end

        Car = getCarTransform(Car0, 0, 0, yInterp);
        Buildings = shiftWorld(BaseBuildings, -oldTx, -oldTz);

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse)
    end
end

    % ---------- THEN MOVE FORWARD ----------
    moveDistance = sqrt((newTx - oldTx)^2 + (newTz - oldTz)^2);
    baseDistance = 35;
    moveFrames = max(8, round(moveFramesBase * moveDistance / baseDistance));

    for f = 1:moveFrames
        alpha = f / moveFrames;

        tx = oldTx + alpha * (newTx - oldTx);
        tz = oldTz - alpha * (newTz - oldTz);

        Car = getCarTransform(Car0, 0, 0, newY);
        Buildings = shiftWorld(BaseBuildings, -tx, -tz);

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse)
    end

    heading = newHeading;
end

pause off

% ==========================================================
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
            y = pi;
        case 'W'
            y = 0;
        case 'N'
            y = -pi/2;
        case 'S'
            y = pi/2;
    end
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

function drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax)
    clf
    set(gca,'Color',[0.2 0.2 0.2])
    hold on

    for n = 1:length(Buildings)
        projectShape(Buildings{n}, Abuild, b, c, d, 'w-');
    end

    projectShape(Car, Acar, b, c, d, 'b-');
    set(findobj(gca,'Type','line'),'LineWidth',2)
    axis([wxmin wxmax wymin wymax])
    axis equal
end