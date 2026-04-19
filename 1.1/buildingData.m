function [dBuild, B] = buildingData()

height = 10;

dBuild = [-5  5  5 -5 -5  5  5 -5;
           0  0  0  0 height height height height;
           0  0 10 10 0  0 10 10;
           1  1  1  1 1  1  1  1];

B = [0 1 0 1 1 0 0 0;
     1 0 1 0 0 1 0 0;
     0 1 0 1 0 0 1 0;
     1 0 1 0 0 0 0 1;
     1 0 0 0 0 1 0 1;
     0 1 0 0 1 0 1 0;
     0 0 1 0 0 1 0 1;
     0 0 0 1 1 0 1 0];
end