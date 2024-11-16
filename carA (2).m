echo off
syms theta



b = -50;             % x perspective view
c =  70;             % y perspective view
d =  270;            % z perspective view


x = 0;             % x theta
z = 0;             % z theta 
sx = 1;            % x scaling factor
sy = 1;            % y scaling facotr
sz = 1;            % z scaling facotr

wxmin = -80;
wxmax =  90;
wymin = -30;
wymax =  20;

n = 0;             % # of loops
inc = pi/24;       % theta rotaion inc
inc2 = 2.25;       % going forward increase
pse = .001;        % pause delay 

dCar = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
0 0 2.5 2.5 2.5 2.5 4 4 4 4 2.5 2.5 2.5 2.5 0 0;
-2.5 2.5 2.5 -2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 2.5 -2.5;
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

Trans = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dCar; % pushes DP1 off the origan 

height = 10;
dBuild = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 height height height height; 0 0 10 10 0 0 10 10; 
    1 1 1 1 1 1 1 1];


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


Zall = vertcat(A);         %entire ajacinty martic


tx1 = 0;
tx2 = 0;
tx3 = 0;
ty1 = 0;
ty2 = 0;
ty3 = 0;
tz1 = 0;
tz2 = 0;
tz3 = 0;

f = 0;

while n < 6
    
    if f == 0
        f0=[40*cos(theta);20*sin(theta);0];
    end
    if f == 1
        f0=[50*cos(theta);0;40*sin(2*theta)];
    end
    if f == 2
        f0=[50*cos(theta);0;40*sin(theta)];
    end



    for newstep = 0 : pi/36 : 2*pi/1
        velocity=diff(f0,theta,1);
        location=subs(f0,theta,newstep);
        direction=subs(velocity,theta,newstep);
        phi = pi + atan2(direction(3,1),direction(1,1));

        tx1 = location(1,1);
        ty1 = location(2,1);
        tz1 = location(3,1);

        T  =  [1 0 0 tx1; 0 1 0 ty1; 0 0 1 tz1; 0 0 0 1];
        T1 =  [1 0 0 tx2; 0 1 0 ty2; 0 0 1 tz2; 0 0 0 1];
        T2 =  [1 0 0 tx3; 0 1 0 ty3; 0 0 1 tz3; 0 0 0 1];
        S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
        Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
        Ry = [cos(phi) 0 -sin(phi) 0;0 1 0 0;sin(phi) 0 cos(phi) 0;0 0 0 1];     % y Rotation matrix
        Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
        P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
        DP = S*T*Rx*T2*Ry*T1*Rz*Trans;    
        D3 = horzcat(DP);
        Dpro = P * D3;  
        GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
        GP2 = GP1(1:2,:);
        D2T = transpose(GP2);
        gplot(Zall,D2T,'K')
        axis ([wxmin wxmax,wymin wymax])
        pause(pse)

    end
    
    n = n +1;
    f = f +1;
    
    if f > 2
        f = 0;
    end
    
end
