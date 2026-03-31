function vertices = buildingGeometry()
    height = 10;
    vertices = [
        -5  5  5 -5 -5  5  5 -5;
         0  0  0  0 height height height height;
         0  0 10 10  0  0 10 10;
         1  1  1  1  1  1  1  1
    ];
end