function BaseBuildings = createCityBlocks(dBuilding)

    xPositions = [35 75 115];
    zPositions = [-20 -60 -100];

    numBuildings = length(xPositions) * length(zPositions);
    BaseBuildings = cell(1, numBuildings);

    k = 1;
    for i = 1:length(xPositions)
        for j = 1:length(zPositions)
            BaseBuildings{k} = [1 0 0 xPositions(i);
                                0 1 0 0;
                                0 0 1 zPositions(j);
                                0 0 0 1] * dBuilding;
            k = k + 1;
        end
    end
end