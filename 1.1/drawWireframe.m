function drawWireframe(adj, pts, colorSpec)

n = size(adj, 1);

for i = 1:n
    for j = i+1:n
        if adj(i,j) ~= 0
            x = [pts(i,1), pts(j,1)];
            y = [pts(i,2), pts(j,2)];
            plot(x, y, colorSpec, 'LineWidth', 1.0);
        end
    end
end

end