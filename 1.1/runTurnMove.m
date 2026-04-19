function [tx1, tz1, state] = runTurnMove(turnDir, tx1, tz1, state, cfg, buildings, A, B)

startY  = mod(state.y, 2*pi);
startTx = tx1;
startTz = tz1;

R = 3;
dTheta = cfg.inc;

fprintf('\n===== START TURN =====\n');

fprintf('Turn radius: %.2f\n', R);

% Heading convention:
% y = 0      -> move in -x
% y = pi/2   -> move in -z
% y = pi     -> move in +x
% y = 3*pi/2 -> move in +z
fx = -cos(startY);
fz = -sin(startY);


leftNx  =  fz;
leftNz  = -fx;
rightNx = -fz;
rightNz =  fx;

if strcmp(turnDir, 'left')


    % when turning left car should be flipped other direction
    % rotation matrix rotating counter clockwize
    % rotation center is on the left side instead of the right side

    cx = startTx + R * leftNx;
    cz = startTz + R * leftNz;
    yEnd = mod(startY + pi/2, 2*pi);
    turnSign = 1;

    %should start 180 degree on the other side of where right starts
    startArcAngle = atan2(startTz - cz, startTx - cx);
else
    cx = startTx + R * rightNx;
    cz = startTz + R * rightNz;
    yEnd = mod(startY - pi/2, 2*pi);
    turnSign = -1;

    startArcAngle = atan2(startTz - cz, startTx - cx);
end


fprintf('Turn center: cx = %.2f, cz = %.2f\n', cx, cz);
fprintf('Start arc angle: %.4f rad (%.2f deg)\n', startArcAngle, rad2deg(startArcAngle));
fprintf('End heading target: %.4f rad (%.2f deg)\n', yEnd, rad2deg(yEnd));
fprintf('Planned rotation amount: %.4f rad (%.2f deg)\n', turnSign * (pi/2), rad2deg(turnSign * (pi/2)));

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
        state.tx2, state.ty2, state.tz2, state.tx3, state.ty3, state.tz3, ...
        cfg.sx, cfg.sy, cfg.sz, cfg.Trans);

    drawScene(cfg.b, cfg.c, cfg.d, cfg.pse, ...
        cfg.wxmin, cfg.wxmax, cfg.wymin, cfg.wymax, ...
        DP, buildings, A, B, tx1, tz1);

    fprintf(['Frame %d: tx1 = %.2f, tz1 = %.2f, ' ...
             'thetaMoved = %.4f rad (%.2f deg), ' ...
             'state.y = %.4f rad (%.2f deg)\n'], ...
        frame, tx1, tz1, ...
        thetaMoved, rad2deg(thetaMoved), ...
        state.y, rad2deg(state.y));
end

state.y = yEnd;

oldRow = state.row;
oldCol = state.col;
[state.row, state.col, state.y] = applyTurnResult(state.row, state.col, startY, turnDir);

fprintf('Turn result:\n');
fprintf('  End world position: tx1 = %.2f, tz1 = %.2f\n', tx1, tz1);
fprintf('  World delta: dTx = %.2f, dTz = %.2f\n', tx1 - startTx, tz1 - startTz);
fprintf('  Grid before: row = %.2f, col = %.2f\n', oldRow, oldCol);
fprintf('  Grid after : row = %.2f, col = %.2f\n', state.row, state.col);
fprintf('  Final heading: %.4f rad (%.2f deg)\n', state.y, rad2deg(state.y));
fprintf('===== END TURN =====\n\n');

end