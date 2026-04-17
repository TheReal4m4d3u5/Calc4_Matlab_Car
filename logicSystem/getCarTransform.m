function Car = getCarTransform(Car0, tx, tz, y)

T = [1 0 0 tx;
     0 1 0 0;
     0 0 1 tz;
     0 0 0 1];

Ry = [cos(y) 0 sin(y) 0;
      0 1 0 0;
     -sin(y) 0 cos(y) 0;
      0 0 0 1];

Car = T * Ry * Car0;

end