function fullAdj = buildSceneAdjacency(carAdj, sceneAdj, sceneVertexCount)
    zTopRight = zeros(size(carAdj, 1), sceneVertexCount);
    zBottomLeft = zeros(sceneVertexCount, size(carAdj, 1));

    fullAdj = [
        carAdj      zTopRight;
        zBottomLeft sceneAdj
    ];
end