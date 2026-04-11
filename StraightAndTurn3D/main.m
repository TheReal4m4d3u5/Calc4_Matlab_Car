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

% ---------- CITY BLOCK LAYOUT ----------
xPositions = [35 75 115];
zPositions = [-20 -60 -100];

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

figure

% ---------- STRAIGHT ----------
for tx = -50:1:25
    tz = 0;
    y = pi;

    Car = getCarTransform(Car0, 0, 0, y);
    Buildings = shiftWorld(BaseBuildings, -tx, -tz);

    drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax);
    pause(pse)
end

% ---------- TURN ----------
turnX = 25;
turnRadius = 10;

for theta = (pi/24):(pi/24):(pi/2)
    tx = turnX + turnRadius * (1 - cos(theta));
    tz = -turnRadius * sin(theta);
    y  = pi - theta;

    Car = getCarTransform(Car0, 0, 0, y);
    Buildings = shiftWorld(BaseBuildings, -tx, -tz);

    drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax);
    pause(pse)
end

% ---------- AFTER TURN ----------
for tz = -(turnRadius + 1):-1:-55
    tx = turnX + turnRadius;
    y = pi/2;

    Car = getCarTransform(Car0, 0, 0, y);
    Buildings = shiftWorld(BaseBuildings, -tx, -tz);

    drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax);
    pause(pse)
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