function cfg = initConfig()

% ---------------- VIEW ----------------
cfg.b = -50;
cfg.c = 70;
cfg.d = 270;

cfg.wxmin = -80;
cfg.wxmax = 80;
cfg.wymin = -40;
cfg.wymax = 40;





% ---------------- TRANSFORM SETTINGS ----------------
cfg.x = 0;
cfg.z = 0;
cfg.sx = 1;
cfg.sy = 1;
cfg.sz = 1;

cfg.inc = pi/24;
cfg.inc2 = 2.25;
cfg.pse = 0.001;
cfg.maxLoops = 100;

% car base translation
cfg.Trans = [1 0 0 0;
             0 1 0 0;
             0 0 1 -15;
             0 0 0 1];
end