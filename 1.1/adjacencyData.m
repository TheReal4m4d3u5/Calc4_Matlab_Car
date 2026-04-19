function [Zall, Z, Zhorz] = adjacencyData(A, B)

Z  = zeros(8,8);
Zhorz = horzcat(Z,Z);
Zvert = vertcat(Z,Z);
Znew4 = zeros(16,64);
Znew5 = zeros(8,64);

Z3  = horzcat(A,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Znew4);
Z4  = horzcat(Zhorz,B,Z,Z,Z,Z,Z,Z,Z,Z,Znew5);
Z5  = horzcat(Zhorz,Z,B,Z,Z,Z,Z,Z,Z,Z,Znew5);
Z6  = horzcat(Zhorz,Z,Z,B,Z,Z,Z,Z,Z,Z,Znew5);
Z7  = horzcat(Zhorz,Z,Z,Z,B,Z,Z,Z,Z,Z,Znew5);
Z8  = horzcat(Zhorz,Z,Z,Z,Z,B,Z,Z,Z,Z,Znew5);
Z9  = horzcat(Zhorz,Z,Z,Z,Z,Z,B,Z,Z,Z,Znew5);
Z10 = horzcat(Zhorz,Z,Z,Z,Z,Z,Z,B,Z,Z,Znew5);
Z11 = horzcat(Zhorz,Z,Z,Z,Z,Z,Z,Z,B,Z,Znew5);
Z12 = horzcat(Zhorz,Z,Z,Z,Z,Z,Z,Z,Z,B,Znew5);

Zall = vertcat(Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12);
end