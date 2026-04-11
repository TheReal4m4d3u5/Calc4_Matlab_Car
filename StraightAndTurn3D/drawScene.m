function drawScene(Car, Buildings, Acar, Abuild, b, c, d, camX, camY, viewWidth, viewHeight)

clf
set(gca,'Color',[0.2 0.2 0.2])
hold on

for k = 1:length(Buildings)
    projectShape(Buildings{k}, Abuild, b, c, d, 'w-');
end

projectShape(Car, Acar, b, c, d, 'b-');

set(findobj(gca,'Type','line'),'LineWidth',2)

axis([camX - viewWidth/2, camX + viewWidth/2, ...
      camY - viewHeight/2, camY + viewHeight/2])
axis equal

end