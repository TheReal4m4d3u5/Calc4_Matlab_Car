function Rz = rotationZMatrix(z)
    Rz = [
        cos(z) -sin(z) 0 0;
        sin(z)  cos(z) 0 0;
        0       0      1 0;
        0       0      0 1
    ];
end