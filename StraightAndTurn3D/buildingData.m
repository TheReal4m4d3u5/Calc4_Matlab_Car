function [dBuilding, Abuild] = buildingData()

h = 12;
w = 12;

dBuilding = [0  w  w  0  0  w  w  0;
             0  0  0  0  h  h  h  h;
             0  0  w  w  0  0  w  w;
             1  1  1  1  1  1  1  1];

Abuild = [0 1 0 1 1 0 0 0;
          1 0 1 0 0 1 0 0;
          0 1 0 1 0 0 1 0;
          1 0 1 0 0 0 0 1;
          1 0 0 0 0 1 0 1;
          0 1 0 0 1 0 1 0;
          0 0 1 0 0 1 0 1;
          0 0 0 1 1 0 1 0];

end