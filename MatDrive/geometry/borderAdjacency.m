function D = borderAdjacency(n)
    D = zeros(n, n);
    for i = 1:n-1
        D(i, i+1) = 1;
        D(i+1, i) = 1;
    end
    D(1, n) = 1;
    D(n, 1) = 1;
end