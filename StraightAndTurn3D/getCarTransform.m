function Car = getCarTransform(Car0, tx, tz, y)

x = 0;
z = 0;

T = [1 0 0 tx;
     0 1 0 0;
     0 0 1 tz;
     0 0 0 1];

Rx = [1 0 0 0;
      0 cos(x) -sin(x) 0;
      0 sin(x)  cos(x) 0;
      0 0 0 1];

Ry = [cos(y) 0 -sin(y) 0;
      0 1 0 0;
      sin(y) 0 cos(y) 0;
      0 0 0 1];

Rz = [cos(z) -sin(z) 0 0;
      sin(z)  cos(z) 0 0;
      0 0 1 0;
      0 0 0 1];

Car = T * Rx * Ry * Rz * Car0;

end