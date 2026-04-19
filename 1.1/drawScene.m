function drawScene(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,buildings,A,B,followTx,followTz)

P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0    0;
     0 0 -1/d 1];

% camera-follow translation:
% move world opposite the car's current position
Tcam = [1 0 0 -followTx;
        0 1 0  0;
        0 0 1 -followTz;
        0 0 0  1];

cla;
hold on;

for k = 1:length(buildings)
    Bcam = Tcam * buildings{k};
    DproB = P * Bcam;
    GPB = DproB(1:3,:) ./ DproB(4,:);
    ptsB = GPB(1:2,:)';

    if all(isfinite(ptsB(:))) && size(ptsB,2) == 2
        localDrawWireframe(B, ptsB, 'b');
    end
end

CarCam = Tcam * DP;
Dpro = P * CarCam;
GP = Dpro(1:3,:) ./ Dpro(4,:);
pts = GP(1:2,:)';

if all(isfinite(pts(:))) && size(pts,2) == 2
    localDrawWireframe(A, pts, 'w');
end

axis([wxmin wxmax wymin wymax]);

axis manual;          % lock axis limits
axis equal;           % keep proportions

set(gca, 'XLimMode', 'manual');
set(gca, 'YLimMode', 'manual');
set(gca, 'ZLimMode', 'manual');

set(gca, 'DataAspectRatioMode', 'manual');
set(gca, 'PlotBoxAspectRatioMode', 'manual');
set(gca, 'CameraViewAngleMode', 'manual');
drawnow;
pause(pse);
hold off;

end

function localDrawWireframe(adj, pts, colorSpec)

n = min(size(adj,1), size(pts,1));

for i = 1:n
    for j = i+1:n
        if adj(i,j) ~= 0
            if all(isfinite([pts(i,1), pts(j,1), pts(i,2), pts(j,2)]))
                plot([pts(i,1) pts(j,1)], ...
                     [pts(i,2) pts(j,2)], ...
                     colorSpec, 'LineWidth', 1.5);
            end
        end
    end
end

end