function Ry = rotationYMatrix(y)
    Ry = [
        cos(y)  0 -sin(y) 0;
        0       1  0      0;
        sin(y)  0  cos(y) 0;
        0       0  0      1
    ];
end