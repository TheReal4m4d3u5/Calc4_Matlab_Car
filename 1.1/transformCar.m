function DP = transformCar(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans)

S = [sx 0  0  0;
     0  sy 0  0;
     0  0  sz 0;
     0  0  0  1];

T  = [1 0 0 tx1;
      0 1 0 ty1;
      0 0 1 tz1;
      0 0 0 1];

T1 = [1 0 0 tx2;
      0 1 0 ty2;
      0 0 1 tz2;
      0 0 0 1];

T2 = [1 0 0 tx3;
      0 1 0 ty3;
      0 0 1 tz3;
      0 0 0 1];

Rx = [1 0 0 0;
      0 cos(x) -sin(x) 0;
      0 sin(x)  cos(x) 0;
      0 0 0 1];

Ry = [cos(y)  0 sin(y) 0;
      0       1  0      0;
      -sin(y)  0  cos(y) 0;
      0       0  0      1];

Rz = [cos(z) -sin(z) 0 0;
      sin(z)  cos(z) 0 0;
      0       0      1 0;
      0       0      0 1];

DP = S * T * Rx * T2 * Ry * T1 * Rz * Trans;
end