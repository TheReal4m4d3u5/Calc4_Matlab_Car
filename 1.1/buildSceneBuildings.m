function buildings = buildSceneBuildings(dBuild)

buildings = cell(1,9);

buildings{1} = [1 0 0   0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
buildings{2} = [1 0 0   0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
buildings{3} = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
buildings{4} = [1 0 0 -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
buildings{5} = [1 0 0  30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
buildings{6} = [1 0 0  30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
buildings{7} = [1 0 0  30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
buildings{8} = [1 0 0   0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
buildings{9} = [1 0 0 -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;

end