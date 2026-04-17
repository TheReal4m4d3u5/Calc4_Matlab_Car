function drawScene(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax)

    clf
    set(gca, 'Color', [0.2 0.2 0.2])
    hold on

    for n = 1:length(Buildings)
        projectShape(Buildings{n}, Abuild, b, c, d, 'w-');
    end

    projectShape(Car, Acar, b, c, d, 'b-');

    set(findobj(gca, 'Type', 'line'), 'LineWidth', 2)

    axis([wxmin wxmax wymin wymax])
    axis equal
end