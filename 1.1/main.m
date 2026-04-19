clear;
clc;
close all;

pause on

[cfg, state, dBuild, A, B] = initScene();

figure('Color','k');

n = 0;

tx1 = 0;
tz1 = 0;

while n < cfg.maxSteps

    buildings = buildBuildings(dBuild);
    [state.row, state.col, state.array] = wrapState(state.row, state.col, state.array);

    oldY   = state.y;
    oldRow = state.row;
    oldCol = state.col;

    [moveType, state.tz2] = chooseMove(state.y);

    % predict heading AFTER the move, but log it BEFORE executing
    newY = predictHeading(oldY, moveType);

    % flip only the displayed move label
    moveLabel = displayMoveName(moveType);

    fprintf(['step=%d   DECISION: move=%s   current heading=%s(%.0f°)   ' ...
             'heading after move=%s(%.0f°)   tx=%.2f tz=%.2f\n'], ...
        n+1, moveLabel, ...
        headingName(oldY), mod(rad2deg(oldY), 360), ...
        headingName(newY), mod(rad2deg(newY), 360), ...
        tx1, tz1);

  %  [tx1, tz1] = gridToWorld(state.row, state.col, state.y, state.tz2);

    [tx1, tz1, state] = runMove(moveType, tx1, tz1, state, cfg, buildings, A, B);
    

    fprintf('DEBUG step=%d: tx=%.2f, tz=%.2f\n', n+1, tx1, tz1);

    n = n + 1;
end

pause off





function label = displayMoveName(moveType)

if strcmp(moveType, 'left')
    label = 'left';
elseif strcmp(moveType, 'right')
    label = 'right';
else
    label = moveType;
end

end


function name = headingName(y)

tol = 1e-6;
y = mod(y, 2*pi);

if abs(y - 0) < tol
    name = 'east';
elseif abs(y - pi/2) < tol
    name = 'north';   % FIXED
elseif abs(y - pi) < tol
    name = 'west';
elseif abs(y - 3*pi/2) < tol
    name = 'south';   % FIXED
else
    name = num2str(y);
end

end