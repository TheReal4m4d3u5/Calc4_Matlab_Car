function projectShape(shape3D, adjacency, b, c, d, lineStyle)

P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0 0;
     0 0 -1/d 1];

proj = P * shape3D;
w = proj(4,:);

% Keep only points safely in front of the camera plane
near = 0.1;
valid = w > near;

% Project only valid points
xyz = nan(size(proj(1:3,:)));
xyz(:, valid) = proj(1:3, valid) ./ [w(valid); w(valid); w(valid)];

points2D = transpose(xyz(1:2,:));

% Draw only edges whose endpoints are both valid
hold on
[nRows, nCols] = size(adjacency);

if nRows == nCols
    % adjacency is a square matrix for gplot-style connectivity
    [iList, jList] = find(triu(adjacency));
else
    % adjacency is already an edge list [i j]
    iList = adjacency(:,1);
    jList = adjacency(:,2);
end

for k = 1:length(iList)
    i = iList(k);
    j = jList(k);

    if valid(i) && valid(j) && ...
       all(isfinite(points2D(i,:))) && all(isfinite(points2D(j,:)))

        plot([points2D(i,1) points2D(j,1)], ...
             [points2D(i,2) points2D(j,2)], ...
             lineStyle);
    end
end

end