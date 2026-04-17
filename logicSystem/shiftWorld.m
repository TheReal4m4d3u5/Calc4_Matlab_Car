function shiftedBuildings = shiftWorld(buildings, dx, dz)
    shiftedBuildings = cell(size(buildings));

    T = [1 0 0 dx;
         0 1 0 0;
         0 0 1 dz;
         0 0 0 1];

    for n = 1:length(buildings)
        shiftedBuildings{n} = T * buildings{n};
    end
end