clear;
clc;
close all;

pause on

b = -30;
c = 30;
d = 100;

% Fixed screen window
wxmin = -80;
wxmax = 80;
wymin = -40;
wymax = 40;

% Animation
pse = 0.05;
framesPerMove = 20;
numMoves = 60;

[dCar, Acar] = carData();
[dBuilding, Abuild] = buildingData();

% Car stays near camera reference position
Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 -20;
        0 0 0 1] * dCar;

% ==========================================================
% BUILDING CENTERS (3x3 buildings)
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

% ==========================================================
% ROAD GRID (4x4 intersections around the 3x3 buildings)
roadX = [20 55 90 125];
roadZ = [-5 -35 -65 -95];

figure

% ==========================================================
% Start on the road grid
col = 2;
row = 2;

tx = roadX(col);
tz = roadZ(row);

% Initial heading:
% y = pi means car is moving East in this coordinate system
y = pi;
lastMove = '';

Car = getCarTransform(Car0, 0, 0, y);
Buildings = shiftWorld(BaseBuildings, -tx, -tz);
drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
    wxmin, wxmax, wymin, wymax);
pause(0.5)

% ==========================================================
% RANDOM DECISION SYSTEM ON 4x4 ROAD GRID
for moveNum = 1:numMoves

    validMoves = {};

    if col < 4
        validMoves{end+1} = 'E';
    end
    if col > 1
        validMoves{end+1} = 'W';
    end
    if row > 1
        validMoves{end+1} = 'N';
    end
    if row < 4
        validMoves{end+1} = 'S';
    end

    reverseMove = getReverseMove(lastMove);
    if ~isempty(reverseMove) && length(validMoves) > 1
        keep = true(1, length(validMoves));
        for i = 1:length(validMoves)
            if strcmp(validMoves{i}, reverseMove)
                keep(i) = false;
            end
        end
        validMoves = validMoves(keep);
    end

    moveChoice = validMoves{randi(length(validMoves))};

    oldCol = col;
    oldRow = row;
    oldTx = roadX(oldCol);
    oldTz = roadZ(oldRow);

    switch moveChoice
        case 'E'
            col = col + 1;
        case 'W'
            col = col - 1;
        case 'N'
            row = row - 1;
        case 'S'
            row = row + 1;
    end

    newTx = roadX(col);
    newTz = roadZ(row);

    turnLabel = getTurnLabel(lastMove, moveChoice);
    headingLabel = moveChoice;

    fprintf('Move %d: %s  heading=%s  row=%d col=%d  tx=%.2f tz=%.2f\n', ...
        moveNum, turnLabel, headingLabel, row, col, newTx, newTz);

    % ======================================================
    % ACTUAL ANIMATION
    if isempty(lastMove) || strcmp(turnLabel, 'straight')
        % Straight move
        y = moveToAngle(moveChoice);

        for f = 1:framesPerMove
            alpha = f / framesPerMove;

            tx = oldTx + alpha * (newTx - oldTx);
            tz = oldTz + alpha * (newTz - oldTz);

            Car = getCarTransform(Car0, 0, 0, y);
            Buildings = shiftWorld(BaseBuildings, -tx, -tz);

            drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
                wxmin, wxmax, wymin, wymax);

            pause(pse)
        end

    else
        % Curved turn using quadratic Bezier
        p0 = [oldTx; oldTz];
        p2 = [newTx; newTz];

        vPrev = moveToVector(lastMove);
        vNext = moveToVector(moveChoice);

        % Control point is intersection of:
        % line from p0 along previous heading
        % line from p2 backward along new heading
        p1 = getTurnControlPoint(p0, vPrev, p2, vNext);

        for f = 1:framesPerMove
            t = f / framesPerMove;

            p = quadBezier(p0, p1, p2, t);
            dp = quadBezierTangent(p0, p1, p2, t);

            tx = p(1);
            tz = p(2);
            y = tangentToAngle(dp);

            Car = getCarTransform(Car0, 0, 0, y);
            Buildings = shiftWorld(BaseBuildings, -tx, -tz);

            drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
                wxmin, wxmax, wymin, wymax);

            pause(pse)
        end
    end

    lastMove = moveChoice;
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

function reverseMove = getReverseMove(move)
    switch move
        case 'E'
            reverseMove = 'W';
        case 'W'
            reverseMove = 'E';
        case 'N'
            reverseMove = 'S';
        case 'S'
            reverseMove = 'N';
        otherwise
            reverseMove = '';
    end
end

function turnLabel = getTurnLabel(lastMove, moveChoice)
    if isempty(lastMove)
        turnLabel = 'start';
        return
    end

    if strcmp(lastMove, moveChoice)
        turnLabel = 'straight';
        return
    end

    switch lastMove
        case 'E'
            if strcmp(moveChoice, 'N')
                turnLabel = 'left';
            elseif strcmp(moveChoice, 'S')
                turnLabel = 'right';
            else
                turnLabel = 'straight';
            end

        case 'W'
            if strcmp(moveChoice, 'N')
                turnLabel = 'right';
            elseif strcmp(moveChoice, 'S')
                turnLabel = 'left';
            else
                turnLabel = 'straight';
            end

        case 'N'
            if strcmp(moveChoice, 'E')
                turnLabel = 'right';
            elseif strcmp(moveChoice, 'W')
                turnLabel = 'left';
            else
                turnLabel = 'straight';
            end

        case 'S'
            if strcmp(moveChoice, 'E')
                turnLabel = 'left';
            elseif strcmp(moveChoice, 'W')
                turnLabel = 'right';
            else
                turnLabel = 'straight';
            end

        otherwise
            turnLabel = 'unknown';
    end
end

function v = moveToVector(move)
    switch move
        case 'E'
            v = [1; 0];
        case 'W'
            v = [-1; 0];
        case 'N'
            v = [0; 1];
        case 'S'
            v = [0; -1];
        otherwise
            v = [0; 0];
    end
end

function y = moveToAngle(move)
    switch move
        case 'E'
            y = pi;
        case 'W'
            y = 0;
        case 'N'
            y = pi/2;
        case 'S'
            y = -pi/2;
        otherwise
            y = 0;
    end
end

function y = tangentToAngle(dp)
    dx = dp(1);
    dz = dp(2);
    y = atan2(dz, -dx);
end

function p1 = getTurnControlPoint(p0, v0, p2, v1)
    % Find intersection of:
    % p0 + a*v0
    % p2 - b*v1
    %
    % Solve: p0 + a*v0 = p2 - b*v1
    % => a*v0 + b*v1 = p2 - p0

    A = [v0, v1];
    rhs = p2 - p0;

    if abs(det(A)) < 1e-9
        % fallback if lines are nearly parallel
        p1 = (p0 + p2) / 2;
    else
        x = A \ rhs;
        a = x(1);
        p1 = p0 + a * v0;
    end
end

function p = quadBezier(p0, p1, p2, t)
    p = (1 - t)^2 * p0 + 2 * (1 - t) * t * p1 + t^2 * p2;
end

function dp = quadBezierTangent(p0, p1, p2, t)
    dp = 2 * (1 - t) * (p1 - p0) + 2 * t * (p2 - p1);
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