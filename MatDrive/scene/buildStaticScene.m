function [sceneVerts, sceneAdj] = buildStaticScene()
    build = buildingGeometry();
    B = buildingAdjacency();

    border = borderGeometry();
    D = borderAdjacency(size(border, 2));

    DP2 = translationMatrix(0,   0,   0)  * build;
    DP3 = translationMatrix(0,   0, -40)  * build;
    DP4 = translationMatrix(-30, 0, -40)  * build;
    DP5 = translationMatrix(-30, 0,   0)  * build;

    sceneVerts = [DP2, DP3, DP4, DP5, border];

    n1 = size(DP2, 2);
    n2 = size(DP3, 2);
    n3 = size(DP4, 2);
    n4 = size(DP5, 2);
    n5 = size(border, 2);

    sceneAdj = blkdiag(B, B, B, B, D);

    expected = n1 + n2 + n3 + n4 + n5;
    if size(sceneAdj, 1) ~= expected
        error('Scene adjacency size mismatch.');
    end
end