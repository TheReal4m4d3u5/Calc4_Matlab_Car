function drawFrame(vertices, adjacency, cfg)
    P = projectionMatrix(cfg.b, cfg.c, cfg.d);

    Dpro = P * vertices;
    denom = Dpro(4,:);

    valid = abs(denom) > 1e-9;
    Dpro = Dpro(:, valid);

    adjacency = adjacency(valid, valid);

    GP1 = Dpro(1:3,:) ./ [Dpro(4,:); Dpro(4,:); Dpro(4,:)];
    GP2 = GP1(1:2,:);
    D2T = transpose(GP2);

    figure(1);
    clf;
    gplot(adjacency, D2T, 'K');
    axis([cfg.wxmin cfg.wxmax cfg.wymin cfg.wymax]);
    axis equal;
    drawnow;
    pause(cfg.pse);
end