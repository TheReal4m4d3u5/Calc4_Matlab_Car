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
framesPerMove = 20;
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

% Start position
col = 2;
row = 2;

tx = roadX(col);
tz = roadZ(row);
y = pi;

lastMove = '';

Car = getCarTransform(Car0, 0, 0, y);
Buildings = shiftWorld(BaseBuildings, -tx, -tz);
drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
    wxmin, wxmax, wymin, wymax);
pause(0.5)

% ---------- RANDOM MOVEMENT ----------
for moveNum = 1:numMoves

    validMoves = {};

    if col < 4, validMoves{end+1} = 'E'; end
    if col > 1, validMoves{end+1} = 'W'; end
    if row > 1, validMoves{end+1} = 'N'; end
    if row < 4, validMoves{end+1} = 'S'; end

    reverseMove = getReverseMove(lastMove);
    if ~isempty(reverseMove) && length(validMoves) > 1
        validMoves = validMoves(~strcmp(validMoves, reverseMove));
    end

    moveChoice = validMoves{randi(length(validMoves))};

    oldTx = roadX(col);
    oldTz = roadZ(row);

    switch moveChoice
        case 'E'
            col = col + 1; y = pi;
        case 'W'
            col = col - 1; y = 0;
        case 'N'
            row = row - 1; y = pi/2;
        case 'S'
            row = row + 1; y = -pi/2;
    end

    newTx = roadX(col);
    newTz = roadZ(row);

    % 🔥 FIX: consistent speed
    moveDistance = sqrt((newTx - oldTx)^2 + (newTz - oldTz)^2);
    baseDistance = 35;
    framesThisMove = max(8, round(framesPerMove * moveDistance / baseDistance));

    for f = 1:framesThisMove
        alpha = f / framesThisMove;

        tx = oldTx + alpha * (newTx - oldTx);
        tz = oldTz + alpha * (newTz - oldTz);

        Car = getCarTransform(Car0, 0, 0, y);
        Buildings = shiftWorld(BaseBuildings, -tx, -tz);

        drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
            wxmin, wxmax, wymin, wymax);

        pause(pse)
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
        case 'E', reverseMove = 'W';
        case 'W', reverseMove = 'E';
        case 'N', reverseMove = 'S';
        case 'S', reverseMove = 'N';
        otherwise, reverseMove = '';
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