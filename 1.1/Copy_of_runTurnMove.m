function [tx1, tz1, state] = runTurnMove(turnDir, tx1, tz1, state, cfg, buildings, A, B)

startY  = mod(state.y, 2*pi);
startTx = tx1;
startTz = tz1;

oldRow = state.row;
oldCol = state.col;

R = 3;
dTheta = cfg.inc;

fprintf('\n===== START TURN =====\n');
fprintf('Turn direction: %s\n', turnDir);
fprintf('Start world position: tx1 = %.2f, tz1 = %.2f\n', startTx, startTz);
fprintf('Start heading: %.4f rad (%.2f deg)\n', startY, mod(rad2deg(startY),360));
fprintf('Turn radius: %.2f\n', R);

% Your movement convention:
% y = 0      -> move in -x
% y = pi/2   -> move in -z
% y = pi     -> move in +x
% y = 3*pi/2 -> move in +z

fx = -cos(startY);
fz = -sin(startY);

% left/right normals relative to forward direction
leftNx  = -fz;
leftNz  =  fx;
rightNx =  fz;
rightNz = -fx;

if strcmp(turnDir, 'left')
    % center always on the LEFT side
    cx = startTx + R * leftNx;
    cz = startTz + R * leftNz;

    yEnd = mod(startY + pi/2, 2*pi);
    turnSign = 1;
else
    % center always on the RIGHT side
    cx = startTx + R * rightNx;
    cz = startTz + R * rightNz;

    yEnd = mod(startY - pi/2, 2*pi);
    turnSign = -1;
end

startArcAngle = atan2(startTz - cz, startTx - cx);

fprintf('Turn center: cx = %.2f, cz = %.2f\n', cx, cz);
fprintf('Start arc angle: %.4f rad (%.2f deg)\n', ...
    startArcAngle, mod(rad2deg(startArcAngle),360));
fprintf('End heading target: %.4f rad (%.2f deg)\n', ...
    yEnd, mod(rad2deg(yEnd),360));

frame = 0;
thetaMoved = 0;

state.tz2 = 0;

while thetaMoved < (pi/2 - 1e-9)
    frame = frame + 1;

    stepAngle = min(dTheta, pi/2 - thetaMoved);
    thetaMoved = thetaMoved + stepAngle;

    arcAngle = startArcAngle + turnSign * thetaMoved;

    tx1 = cx + R * cos(arcAngle);
    tz1 = cz + R * sin(arcAngle);

    state.y = mod(startY + turnSign * thetaMoved, 2*pi);

    DP = transformCar(cfg.x, state.y, cfg.z, tx1, state.ty1, tz1, ...
        state.tx2, state.ty2, state.tz2, ...
        state.tx3, state.ty3, state.tz3, ...
        cfg.sx, cfg.sy, cfg.sz, cfg.Trans);

    drawScene(cfg.b, cfg.c, cfg.d, cfg.pse, ...
        cfg.wxmin, cfg.wxmax, cfg.wymin, cfg.wymax, ...
        DP, buildings, A, B, tx1, tz1);

    fprintf(['Frame %d: tx1 = %.2f, tz1 = %.2f, ' ...
             'thetaMoved = %.4f rad (%.2f deg), ' ...
             'state.y = %.4f rad (%.2f deg)\n'], ...
        frame, tx1, tz1, ...
        thetaMoved, mod(rad2deg(thetaMoved),360), ...
        state.y, mod(rad2deg(state.y),360));
end

state.y = yEnd;
[state.row, state.col, state.y] = applyTurnResult(oldRow, oldCol, startY, turnDir);

fprintf('Turn result:\n');
fprintf('  End world position: tx1 = %.2f, tz1 = %.2f\n', tx1, tz1);
fprintf('  World delta: dTx = %.2f, dTz = %.2f\n', tx1 - startTx, tz1 - startTz);
fprintf('  Grid before: row = %.2f, col = %.2f\n', oldRow, oldCol);
fprintf('  Grid after : row = %.2f, col = %.2f\n', state.row, state.col);
fprintf('  Final heading: %.4f rad (%.2f deg)\n', state.y, mod(rad2deg(state.y),360));
fprintf('===== END TURN =====\n\n');

end