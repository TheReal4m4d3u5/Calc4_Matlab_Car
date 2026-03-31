clear;
clc;
close all;

% Setup paths
basePath = fileparts(mfilename('fullpath'));
addpath(fullfile(basePath, '..', 'geometry'));
addpath(fullfile(basePath, '..', 'transforms'));
addpath(fullfile(basePath, '..', 'render'));
addpath(fullfile(basePath, '..', 'motion'));

% Projection settings
b = -50;
c = 70;
d = 270;

% Axis window
wxmin = -80;
wxmax = 90;
wymin = -30;
wymax = 20;

% Load car
[vertices, adjacency] = carGeometry();

% Step size
dt = 0.01;

% Animation loop
for t = 0 : 0.1 : 2*pi

    % Current position
    p1 = position(t);

    % Slightly forward position (for velocity)
    p2 = position(t + dt);

    % Direction vector (numerical derivative)
    direction = p2 - p1;

    % Heading angle
    phi = pi + atan2(direction(3), direction(1));

    % Translation
    T = translationMatrix(p1(1), p1(2), p1(3));

    % Rotation
    Ry = rotationYMatrix(phi);

    % Apply transforms
clear;
clc;
close all;

basePath = fileparts(mfilename('fullpath'));
addpath(fullfile(basePath, '..', 'geometry'));
addpath(fullfile(basePath, '..', 'scene'));
addpath(fullfile(basePath, '..', 'transforms'));
addpath(fullfile(basePath, '..', 'render'));
addpath(fullfile(basePath, '..', 'motion'));

cfg = defaultConfig();

carBase = carGeometry();
carAdj = carAdjacency();
[sceneVerts, sceneAdj] = buildStaticScene();

dt = 0.01;

for t = 0:0.08:2*pi
    p1 = position(t);
    p2 = position(t + dt);
    dir = numericVelocity(p1, p2);
    phi = headingFromDirection(dir);

    DP = applyCarTransform(carBase, p1(1), p1(2), p1(3), 0, phi, 0, 1, 1, 1);

    frameVerts = [DP, sceneVerts];
    frameAdj = buildSceneAdjacency(carAdj, sceneAdj, size(sceneVerts, 2));

    drawFrame(frameVerts, frameAdj, cfg);
end