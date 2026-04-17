function drawSceneFixed(ax, Car, Buildings, b, c, d, wxmin, wxmax, wymin, wymax)

    cla(ax);
    hold(ax, 'on');

    axis(ax, [wxmin wxmax wymin wymax]);
    axis(ax, 'equal');
    axis(ax, 'manual');
    grid(ax, 'off');

    set(ax, 'XLimMode', 'manual', 'YLimMode', 'manual');
    set(ax, 'CameraViewAngleMode', 'manual');
    set(ax, 'DataAspectRatioMode', 'manual');
    set(ax, 'PlotBoxAspectRatioMode', 'manual');

    % Draw buildings
    for k = 1:numel(Buildings)
        B = Buildings{k};
        plot(ax, B(1,:), B(2,:), 'k', 'LineWidth', 1.5);
    end

    % Draw car
    plot(ax, Car(1,:), Car(2,:), 'r', 'LineWidth', 2);

    hold(ax, 'off');
end