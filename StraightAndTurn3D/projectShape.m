function projectShape(shape3D, adjacency, b, c, d, lineStyle)

P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0 0;
     0 0 -1/d 1];

proj = P * shape3D;
w = proj(4,:);

% Skip drawing if any projected point is too close to the camera plane
if any(abs(w) < 0.1)
    return
end

xyz = proj(1:3,:) ./ [w; w; w];
points2D = transpose(xyz(1:2,:));

% Skip if projection exploded numerically
if any(~isfinite(points2D), 'all')
    return
end

gplot(adjacency, points2D, lineStyle)

end