function P = projectionMatrix(b, c, d)
    P = [
        1 0 -b/d 0;
        0 1 -c/d 0;
        0 0 0    0;
        0 0 -1/d 1
    ];
end