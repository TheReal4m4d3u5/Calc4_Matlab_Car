function buildings = buildBuildings(dBuild)

DP0 = [1 0 0   0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
DP1 = [1 0 0   0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
DP2 = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
DP3 = [1 0 0 -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
DP4 = [1 0 0  30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
DP5 = [1 0 0  30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
DP6 = [1 0 0  30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
DP7 = [1 0 0   0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
DP8 = [1 0 0 -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;

buildings = {DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8};

end