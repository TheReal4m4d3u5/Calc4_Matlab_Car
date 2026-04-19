clear;
clc;
close all;

pause on

% ---------------- VIEW ----------------
b = -50;
c = 70;
d = 270;

wxmin = -80;
wxmax = 90;
wymin = -30;
wymax = 20;

% ---------------- TRANSFORM SETTINGS ----------------
x = 0;
z = 0;
sx = 1;
sy = 1;
sz = 1;

n = 0;
inc = pi/24;
inc2 = 2.25;
pse = 0.001;

% ---------------- CAR DATA ----------------
dCar = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -0.75 -0.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
         0    0    2.5  2.5  2.5  2.5   4     4    4    4    2.5  2.5  2.5  2.5  0    0;
        -2.5  2.5  2.5 -2.5 -2.5  2.5  -2.5  2.5 -2.5  2.5 -2.5  2.5 -2.5  2.5  2.5 -2.5;
         1    1    1    1    1    1     1     1    1    1    1    1    1    1    1    1];

Trans = [1 0 0 0;
         0 1 0 0;
         0 0 1 -15;
         0 0 0 1] * dCar;

% ---------------- BUILDING DATA ----------------
height = 10;
dBuild = [-5  5  5 -5 -5  5  5 -5;
           0  0  0  0 height height height height;
           0  0 10 10 0  0 10 10;
           1  1  1  1 1  1  1  1];

% ---------------- ADJACENCY MATRICES ----------------
A = [0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1;
     1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0;
     0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0;
     1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0;
     0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0;
     0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0;
     0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0;
     0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0;
     0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0;
     0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1;
     0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0;
     0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
     1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0];

B = [0 1 0 1 1 0 0 0;
     1 0 1 0 0 1 0 0;
     0 1 0 1 0 0 1 0;
     1 0 1 0 0 0 0 1;
     1 0 0 0 0 1 0 1;
     0 1 0 0 1 0 1 0;
     0 0 1 0 0 1 0 1;
     0 0 0 1 1 0 1 0];

% ---------------- BUILD 9-BUILDING SCENE ADJACENCY ----------------
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

% ---------------- INITIAL STATE ----------------
tx2 = 0;
tx3 = 0;
ty1 = 0;
ty2 = 0;
ty3 = 0;
tz2 = 0;
tz3 = 0;

array = 0;
y = pi;
row = 0;
col = 1.5;

figure('Color','w');

while n < 100

    % ---------------- BUILDING POSITIONS ----------------
    DP0 = [1 0 0   0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
    DP1 = [1 0 0   0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
    DP2 = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
    DP3 = [1 0 0 -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
    DP4 = [1 0 0  30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
    DP5 = [1 0 0  30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
    DP6 = [1 0 0  30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    DP7 = [1 0 0   0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    DP8 = [1 0 0 -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;

    % ---------------- WRAP STATE ----------------
    if row < -1
        row = 1.5;
    end
    if row > 2
        row = -0.5;
    end
    if col < -1
        col = 1.5;
        array = 1;
    end
    if col > 2
        col = -0.5;
        array = -1;
    end

    if array < -1
        array = 1;
    end
    if array > 1
        array = -1;
    end

    % ---------------- MOVE CHOICE ----------------
    r = randi(3,1);

    if y == 0
        if r == 1
            function1 = 1;
        elseif r == 2
            function1 = 5;
            tz2 = 30;
        else
            function1 = 9;
        end
    elseif y == pi
        if r == 1
            function1 = 2;
        elseif r == 2
            function1 = 6;
            tz2 = 30;
        else
            function1 = 10;
        end
    elseif y == pi/2
        if r == 1
            function1 = 3;
        elseif r == 2
            function1 = 7;
            tz2 = 30;
        else
            function1 = 11;
            tz2 = 0;
        end
    elseif y == 3*pi/2
        if r == 1
            function1 = 4;
        elseif r == 2
            function1 = 8;
            tz2 = 30;
        else
            function1 = 12;
        end
    end

    % ---------------- GRID TO WORLD ----------------
    if y == 0 && tz2 == 0
        if row == -1, tz1 = -40; end
        if row == 0,  tz1 = 0;   end
        if row == 1,  tz1 = 40;  end
        if row == 2,  tz1 = 75;  end
        if col == -0.5, tx1 = -30; end
        if col ==  0.5, tx1 = 0;   end
        if col ==  1.5, tx1 = 30;  end
    end

    if y == pi && tz2 == 0
        if row == -1, tz1 = -70; end
        if row == 0,  tz1 = -30; end
        if row == 1,  tz1 = 10;  end
        if row == 2,  tz1 = 45;  end
        if col == -0.5, tx1 = -30; end
        if col ==  0.5, tx1 = 0;   end
        if col ==  1.5, tx1 = 30;  end
    end

    if y == pi/2 && tz2 == 0
        if col == -1, tx1 = -60; end
        if col ==  0, tx1 = -30; end
        if col ==  1, tx1 = 0;   end
        if col ==  2, tx1 = 30;  end
        if row == -0.5, tz1 = -25; end
        if row ==  0.5, tz1 = 10;  end
        if row ==  1.5, tz1 = 40;  end
    end

    if y == 3*pi/2 && tz2 == 0
        if col == -1, tx1 = -30; end
        if col ==  0, tx1 = 0;   end
        if col ==  1, tx1 = 30;  end
        if col ==  2, tx1 = 60;  end
        if row == -0.5, tz1 = -30; end
        if row ==  0.5, tz1 = 10;  end
        if row ==  1.5, tz1 = 43;  end
    end

    if y == 0 && tz2 == 30
        if row == -1, tz1 = -75; end
        if row == 0,  tz1 = -40; end
        if row == 1,  tz1 = 0;   end
        if row == 2,  tz1 = 40;  end
        if col == -0.5, tx1 = -30; end
        if col ==  0.5, tx1 = 0;   end
        if col ==  1.5, tx1 = 30;  end
    end

    if y == pi && tz2 == 30
        if row == -1, tz1 = -40; end
        if row == 0,  tz1 = 0;   end
        if row == 1,  tz1 = 40;  end
        if row == 2,  tz1 = 80;  end
        if col == -0.5, tx1 = -30; end
        if col ==  0.5, tx1 = 0;   end
        if col ==  1.5, tx1 = 30;  end
    end

    if y == pi/2 && tz2 == 30
        if col == -1, tx1 = -30; end
        if col ==  0, tx1 = 0;   end
        if col ==  1, tx1 = 30;  end
        if col ==  2, tx1 = 60;  end
        if row == -0.5, tz1 = -40; end
        if row ==  0.5, tz1 = 0;   end
        if row ==  1.5, tz1 = 45;  end
    end

    if y == 3*pi/2 && tz2 == 30
        if col == -1, tx1 = -60; end
        if col ==  0, tx1 = -30; end
        if col ==  1, tx1 = 0;   end
        if col ==  2, tx1 = 30;  end
        if row == -0.5, tz1 = -30; end
        if row ==  0.5, tz1 = 15;  end
        if row ==  1.5, tz1 = 45;  end
    end

    % ---------------- MOVES ----------------
    if function1 == 1
        var = 0;
        y = 0;
        while var <= 12
            if tx1 <= -45
                tx1 = 45;
                array = array - 1;
            end
            tx1 = tx1 - inc2;
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            var = var + 1;
        end
        col = col - 1;
    end

    if function1 == 2
        y = pi;
        var = 0;
        while var <= 12
            if tx1 >= 41
                tx1 = -46;
                array = array + 1;
            end
            tx1 = tx1 + inc2;
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            var = var + 1;
        end
        col = col + 1;
    end

    if function1 == 3
        y = pi/2;
        var = 0;
        while var <= 17
            if tz1 <= -45
                tz1 = 75;
            end
            tz1 = tz1 - inc2;
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            var = var + 1;
        end
        row = row - 1;
    end

    if function1 == 4
        y = 3*pi/2;
        var = 0;
        while var <= 14
            if tz1 >= 60
                tz1 = -55;
            end
            tz1 = tz1 + inc2;
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            var = var + 1;
        end
        row = row + 1;
    end

    if function1 == 5
        y = 0;
        tz2 = 30;
        while y <= pi/2
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y + inc;
        end
        col = col - 0.5;
        row = row - 0.5;
        y = pi/2;
        tz2 = 0;
    end

    if function1 == 6
        y = pi;
        tz2 = 30;
        while y <= 3*pi/2
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y + inc;
        end
        col = col + 0.5;
        row = row + 0.5;
        y = 3*pi/2;
        tz2 = 0;
    end

    if function1 == 7
        y = pi/2;
        tz2 = 30;
        while y <= pi
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y + inc;
        end
        col = col + 0.5;
        row = row - 0.5;
        y = pi;
        tz2 = 0;
    end

    if function1 == 8
        y = 3*pi/2;
        tz2 = 30;
        while y <= 2*pi
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y + inc;
        end
        col = col - 0.5;
        row = row + 0.5;
        y = 0;
        tz2 = 0;
    end

    if function1 == 9
        y = 2*pi;
        while y >= 3*pi/2
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y - inc;
        end
        col = col - 0.5;
        row = row + 0.5;
        y = 3*pi/2;
    end

    if function1 == 10
        y = pi;
        while y >= pi/2
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y - inc;
        end
        col = col + 0.5;
        row = row - 0.5;
        y = pi/2;
    end

    if function1 == 11
        y = pi/2;
        while y >= 0
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y - inc;
        end
        row = row - 0.5;
        col = col - 0.5;
        y = 0;
    end

    if function1 == 12
        y = -pi/2;
        while y >= -pi
            DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
            carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall,A,B);
            y = y - inc;
        end
        col = col + 0.5;
        row = row + 0.5;
        y = pi;
    end

    disp(['col = ', num2str(col), '   row = ', num2str(row), '   y = ', num2str(y)]);

    n = n + 1;
end

pause off


function DP = carFunction1_local(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans)

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

Ry = [cos(y)  0 -sin(y) 0;
      0       1  0      0;
      sin(y)  0  cos(y) 0;
      0       0  0      1];

Rz = [cos(z) -sin(z) 0 0;
      sin(z)  cos(z) 0 0;
      0       0      1 0;
      0       0      0 1];

DP = S * T * Rx * T2 * Ry * T1 * Rz * Trans;
end


function carFunction2_local(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,~,A,B)

P = [1 0 -b/d 0;
     0 1 -c/d 0;
     0 0 0    0;
     0 0 -1/d 1];

buildings = {DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8};

cla;
hold on;

% draw buildings in black
for k = 1:length(buildings)
    DproB = P * buildings{k};
    GPB = DproB(1:3,:) ./ DproB(4,:);
    ptsB = GPB(1:2,:)';
    gplot(B, ptsB, 'k');
end

% draw car in blue
Dpro = P * DP;
GP = Dpro(1:3,:) ./ Dpro(4,:);
pts = GP(1:2,:)';
gplot(A, pts, 'b');

axis([wxmin wxmax wymin wymax]);
axis manual;
axis equal;
drawnow;
pause(pse);
hold off;

end