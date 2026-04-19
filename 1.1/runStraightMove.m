function [tx1, tz1, state] = runStraightMove(tx1, tz1, state, cfg, buildings, A, B)

startTx = tx1;
startTz = tz1;


fprintf('\n===== START STRAIGHT MOVE =====\n');
fprintf('Start position: tx1 = %.2f, tz1 = %.2f\n', startTx, startTz);


% ---------------- EAST (y = 0) ----------------
if state.y == 0
    var = 0;
    while var <= 12

        if tx1 <= -45
            fprintf('*** WRAP X (EAST) *** before: %.2f\n', tx1);
            tx1 = 45;
            state.array = state.array - 1;
            fprintf('*** WRAP X (EAST) *** after : %.2f\n', tx1);
        end

        tx1 = tx1 + cfg.inc2;

        fprintf('Step %d: tx1 = %.2f, tz1 = %.2f\n', var, tx1, tz1);

        DP = transformCar(cfg.x,state.y,cfg.z,tx1,state.ty1,tz1,...
            state.tx2,state.ty2,state.tz2,state.tx3,state.ty3,state.tz3,...
            cfg.sx,cfg.sy,cfg.sz,cfg.Trans);

        drawScene(cfg.b,cfg.c,cfg.d,cfg.pse,...
            cfg.wxmin,cfg.wxmax,cfg.wymin,cfg.wymax,...
            DP,buildings,A,B,tx1,tz1);

        var = var + 1;
    end
    state.col = state.col - 1;

% ---------------- WEST (y = pi) ----------------
elseif state.y == pi
    var = 0;
    while var <= 12

        if tx1 >= 41
            fprintf('*** WRAP X (WEST) *** before: %.2f\n', tx1);
            tx1 = -46;
            state.array = state.array + 1;
            fprintf('*** WRAP X (WEST) *** after : %.2f\n', tx1);
        end

        tx1 = tx1 - cfg.inc2;

        fprintf('Step %d: tx1 = %.2f, tz1 = %.2f\n', var, tx1, tz1);

        DP = transformCar(cfg.x,state.y,cfg.z,tx1,state.ty1,tz1,...
            state.tx2,state.ty2,state.tz2,state.tx3,state.ty3,state.tz3,...
            cfg.sx,cfg.sy,cfg.sz,cfg.Trans);

        drawScene(cfg.b,cfg.c,cfg.d,cfg.pse,...
            cfg.wxmin,cfg.wxmax,cfg.wymin,cfg.wymax,...
            DP,buildings,A,B,tx1,tz1);

        var = var + 1;
    end
    state.col = state.col + 1;

% ---------------- NORTH (y = pi/2) ----------------
elseif state.y == pi/2
    var = 0;
    while var <= 17

        if tz1 <= -45
            fprintf('*** WRAP Z (NORTH) *** before: %.2f\n', tz1);
            tz1 = 75;
            fprintf('*** WRAP Z (NORTH) *** after : %.2f\n', tz1);
        end

        tz1 = tz1 - cfg.inc2;

        fprintf('Step %d: tx1 = %.2f, tz1 = %.2f\n', var, tx1, tz1);

        DP = transformCar(cfg.x,state.y,cfg.z,tx1,state.ty1,tz1,...
            state.tx2,state.ty2,state.tz2,state.tx3,state.ty3,state.tz3,...
            cfg.sx,cfg.sy,cfg.sz,cfg.Trans);

        drawScene(cfg.b,cfg.c,cfg.d,cfg.pse,...
            cfg.wxmin,cfg.wxmax,cfg.wymin,cfg.wymax,...
            DP,buildings,A,B,tx1,tz1);

        var = var + 1;
    end
    state.row = state.row - 1;

% ---------------- SOUTH (y = 3*pi/2) ----------------
elseif state.y == 3*pi/2
    var = 0;
    while var <= 14

        if tz1 >= 60
            fprintf('*** WRAP Z (SOUTH) *** before: %.2f\n', tz1);
            tz1 = -55;
            fprintf('*** WRAP Z (SOUTH) *** after : %.2f\n', tz1);
        end

        tz1 = tz1 + cfg.inc2;

        fprintf('Step %d: tx1 = %.2f, tz1 = %.2f\n', var, tx1, tz1);

        DP = transformCar(cfg.x,state.y,cfg.z,tx1,state.ty1,tz1,...
            state.tx2,state.ty2,state.tz2,state.tx3,state.ty3,state.tz3,...
            cfg.sx,cfg.sy,cfg.sz,cfg.Trans);

        drawScene(cfg.b,cfg.c,cfg.d,cfg.pse,...
            cfg.wxmin,cfg.wxmax,cfg.wymin,cfg.wymax,...
            DP,buildings,A,B,tx1,tz1);

        var = var + 1;
    end
    state.row = state.row + 1;
end

% -------- END DEBUG --------
fprintf('End position: tx1 = %.2f, tz1 = %.2f\n', tx1, tz1);
fprintf('Delta: dTx = %.2f, dTz = %.2f\n', tx1 - startTx, tz1 - startTz);
fprintf('Heading unchanged: %.4f rad (%.2f deg)\n', state.y, rad2deg(state.y));
fprintf('===== END STRAIGHT MOVE =====\n\n');

end