clear;
clc;
close all;

pause on

b = -30;
c = 30;
d = 70;

% Fixed screen window
wxmin = -80;
wxmax = 80;
wymin = -40;
wymax = 40;

pse = 0.03;

[dCar, Acar] = carData();
[dBuilding, Abuild] = buildingData();

% Car stays near camera reference position
Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 -20;
        0 0 0 1] * dCar;

% ==========================================================
% CITY LAYOUT
% ==========================================================
xPositions = [35 75 115];
zPositions = [-20 -60 -100];

xOffsetBuildings = -10;
zOffsetBuildings = 0;

BaseBuildings = buildCity(dBuilding, xPositions, zPositions, ...
    xOffsetBuildings, zOffsetBuildings);

% ==========================================================
% ROAD GRID / CAR GRID
% ==========================================================
roadX = [15 55 95];
roadZ = [0 40 80];

xOffset = 10;
zOffset = 20;

% ==========================================================
% MOTION SETTINGS
% ==========================================================
moveFramesBase = 28;
turnFrames = 18;

preTurnDistance = 6;
postTurnDistance = 6;

numMoves = 20;

% ==========================================================
% INITIAL STATE
% ==========================================================
row = 3;
col = 1;
heading = 'E';

startSx = roadX(col) + xOffset;
startSz = -roadZ(row) + zOffset;
currentPos = [startSx; startSz];

% ==========================================================
% INITIAL DRAW
% ==========================================================
dir0 = headingVector(heading);
y0 = vecToYaw(dir0(1), dir0(2)) + pi;

Car = getCarTransform(Car0, 0, 0, y0);
Buildings = shiftWorld(BaseBuildings, -currentPos(1), -currentPos(2));

drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
    wxmin, wxmax, wymin, wymax);

pause(1);

% ==========================================================
% MAIN LOOP
% ==========================================================
for moveNum = 1:numMoves
    [row, col, heading, currentPos] = driveStep( ...
        moveNum, row, col, heading, currentPos, ...
        roadX, roadZ, xOffset, zOffset, ...
        Car0, BaseBuildings, Acar, Abuild, ...
        b, c, d, wxmin, wxmax, wymin, wymax, ...
        pse, moveFramesBase, turnFrames, ...
        preTurnDistance, postTurnDistance);
end