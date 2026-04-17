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
turnFrames = 28;
moveFramesBase = 18;
preTurnDistance = 10;
postTurnDistance = 15;

% ==========================================================
% Buildings SETTINGS
% ==========================================================
xOffset = -35;   % shift left
zOffset = 0;     % no forward/back shift

% ==========================================================
% DATA
% ==========================================================
[dCar, Acar] = carData();
[dBuilding, Abuild] = buildingData();

Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 1;
        0 0 0 1] * dCar;

Rfix = [cos(pi)  0 -sin(pi) 0;
        0        1 0        0;
        sin(pi)  0 cos(pi)  0;
        0        0 0        1];

Car0 = Rfix * Car0;

xPositions = [35 75 115];
zPositions = [-20 -60 -120];
BaseBuildings = buildCity(dBuilding, xPositions, zPositions, xOffset, zOffset);

% ==========================================================
% ROAD GRID
% ==========================================================
roadX = [0 35 75 115];
roadZ = [0 -35 -75 -120];

row = 1;
col = 1;
heading = 'E';
zOffset = -100;

sx = roadX(col);

sz = -roadZ(row) + zOffset;

% ✅ NEW
currentPos = [sx; sz];

y = headingToYaw(heading);

Car = getCarTransform(Car0, 0, 0, y);
Buildings = shiftWorld(BaseBuildings, -sx, -sz);

drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, ...
    wxmin, wxmax, wymin, wymax);
pause(0.5);

% ==========================================================
% DRIVE LOOP
% ==========================================================
for moveNum = 1:numMoves

    [row, col, heading, currentPos] = driveStep( ...
        moveNum, row, col, heading, currentPos, ...
        roadX, roadZ, zOffset, ...
        Car0, BaseBuildings, Acar, Abuild, ...
        b, c, d, wxmin, wxmax, wymin, wymax, ...
        pse, moveFramesBase, turnFrames, preTurnDistance, postTurnDistance);

 end

pause off