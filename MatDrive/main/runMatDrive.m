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

[sceneVerts, sceneAdj] = buildStaticScene();

% state = struct();
% state.x = cfg.x;
% state.y = pi;
% state.z = cfg.z;
% state.tx = 0;
% state.ty = 0;
% state.tz = -30;
% state.sx = 1;
% state.sy = 1;
% state.sz = 1;
% 
% 
% 
% state.decision = 1;
% state.turnTarget = pi/2;
% state.count = 0;
% state.mode = "turning";


state.x = cfg.x;
state.y = 0;
state.z = cfg.z;
state.tx = 0;
state.ty = 0;
state.tz = -30;
state.sx = 1;
state.sy = 1;
state.sz = 1;

state.decision = 2;
state.turnTarget = 0;
state.count = 0;
state.mode = "straight";



carBase = carGeometry();
carAdj = carAdjacency();

while ishandle(figure(1))
    [state, finished] = stepDecisionMotion(state, cfg);

    DP = applyCarTransform( ...
        carBase, ...
        state.tx, state.ty, state.tz, ...
        state.x, state.y, state.z, ...
        state.sx, state.sy, state.sz ...
    );

    frameVerts = [DP, sceneVerts];
    frameAdj = buildSceneAdjacency(carAdj, sceneAdj, size(sceneVerts, 2));

    drawFrame(frameVerts, frameAdj, cfg);

    if finished
        break;
    end
end