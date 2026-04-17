function drawSceneFixed(Car, Buildings, Acar, Abuild, b, c, d, wxmin, wxmax, wymin, wymax)

clf;
set(gca, 'Color', [0 0 0]);
hold on;

for n = 1:length(Buildings)
    projectShape(Buildings{n}, Abuild, b, c, d, 'b-');
end

projectShape(Car, Acar, b, c, d, 'w-');
set(findobj(gca, 'Type', 'line'), 'LineWidth', 1.5);

axis([wxmin wxmax wymin wymax]);
axis equal;
drawnow;
end