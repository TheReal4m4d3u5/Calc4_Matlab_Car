clear;
clc;
close all;

pause on

% Perspective
b = -30;
c = 30;
d = 70;

% Window
wxmin = -80;
wxmax = 80;
wymin = -30;
wymax = 30;

% Pause speed
pse = 0.03;

% Get car data
[dCar, Acar] = carData();

% Get building data
[dBuilding, Abuild] = buildingData();

% Car starting position
Car0 = [1 0 0 0;
        0 1 0 0;
        0 0 1 -20;
        0 0 0 1] * dCar;

% Move building out of the car's path
Building0 = [1 0 0 45;
             0 1 0 0;
             0 0 1 -20;
             0 0 0 1] * dBuilding;

% Rotation
x = 0;
y = pi;     % rotate car so it faces the driving direction
z = 0;

figure

for tx = -50:1:10

    Tcar = [1 0 0 tx;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];

    Rx = [1 0 0 0;
          0 cos(x) -sin(x) 0;
          0 sin(x)  cos(x) 0;
          0 0 0 1];

    Ry = [cos(y) 0 -sin(y) 0;
          0 1 0 0;
          sin(y) 0 cos(y) 0;
          0 0 0 1];

    Rz = [cos(z) -sin(z) 0 0;
          sin(z)  cos(z) 0 0;
          0 0 1 0;
          0 0 0 1];

    Car = Tcar * Rx * Ry * Rz * Car0;

    clf
    set(gca, 'Color', [0.2 0.2 0.2])

    % White building
    projectShape(Building0, Abuild, b, c, d, 'w-');
    hold on

    % Blue car
    projectShape(Car, Acar, b, c, d, 'b-');

    set(findobj(gca,'Type','line'),'LineWidth',2)

    axis([wxmin wxmax wymin wymax])
    axis equal
    pause(pse)
end

pause off