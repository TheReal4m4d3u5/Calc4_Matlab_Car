function projectShape(shape3D, adjacency, b, c, d, lineStyle)

P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0 0;
     0 0 -1/d 1];

proj = P * shape3D;
xyz = proj(1:3,:) ./ [proj(4,:); proj(4,:); proj(4,:)];
points2D = transpose(xyz(1:2,:));

gplot(adjacency, points2D, lineStyle)

end