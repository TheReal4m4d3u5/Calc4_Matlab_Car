function Car = getCarTransform(Car0, tx, tz, y)

Ry = [ cos(y)  0  -sin(y)  0;
       0       1   0       0;
       sin(y)  0   cos(y)  0;
       0       0   0       1];

% 180-degree model alignment fix
Rfix = [ -1  0   0  0;
          0  1   0  0;
          0  0  -1  0;
          0  0   0  1];

T = [1 0 0 tx;
     0 1 0 0;
     0 0 1 tz;
     0 0 0 1];

Car = T * Ry * Rfix * Car0;
end