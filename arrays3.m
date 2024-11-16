echo off
syms theta
pause on
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

Trans = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dCar % pushes DP1 off the origan 

height = 10;
dBuild = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 height height height height; 0 0 10 10 0 0 10 10; 
    1 1 1 1 1 1 1 1];

D = zeros(64,64);

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

Znew = zeros(64,88);
Znew1 = zeros(64,8);
Znew2 = zeros(64,16);
Z = zeros(8,8);
Zhorz = horzcat(Z,Z); % 8 x 16
Zvert = vertcat(Z,Z); % 16 x 8
Znew3 = zeros(16,8);
Znew4 = zeros(16,64);
Znew5 = zeros(8,64);

Z3   = horzcat(A,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Zvert,Znew4);   %16 x 16, 16 x 8, 16 x 64 
Z4   = horzcat(Zhorz,B,Z,Z,Z,Z,Z,Z,Z,Z,Znew5);           % 8 x 16, 8 x 8, 8 x 64
Z5   = horzcat(Zhorz,Z,B,Z,Z,Z,Z,Z,Z,Z,Znew5);           % 32 x 8 3rd block of aj
Z6   = horzcat(Zhorz,Z,Z,B,Z,Z,Z,Z,Z,Z,Znew5);         %32 x 8 4th block of aj
Z7   = horzcat(Zhorz,Z,Z,Z,B,Z,Z,Z,Z,Z,Znew5);
Z8   = horzcat(Zhorz,Z,Z,Z,Z,B,Z,Z,Z,Z,Znew5);       % 16 X 8 
Z9   = horzcat(Zhorz,Z,Z,Z,Z,Z,B,Z,Z,Z,Znew5);       % 16 X 8
Z10  = horzcat(Zhorz,Z,Z,Z,Z,Z,Z,B,Z,Z,Znew5);       % 16 X 8 
Z11  = horzcat(Zhorz,Z,Z,Z,Z,Z,Z,Z,B,Z,Znew5);       % 16 X 8 
Z12  = horzcat(Zhorz,Z,Z,Z,Z,Z,Z,Z,Z,B,Znew5);       % 16 X 8 
Zall = vertcat(Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12);         %entire ajacinty martic

        DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP1 = [1 0 0    0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP2 = [1 0 0  -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP3 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP4 = [1 0 0   30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP5 = [1 0 0   30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP6 = [1 0 0   30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP7 = [1 0 0    0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP8 = [1 0 0  -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
   
DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;


% tx1 = -30;
tx2 = 0;
tx3 = 0;
ty1 = 0;
ty2 = 0;
ty3 = 0;
% tz1 = 0;
tz2 = 0;
tz3 = 0;

% function1 = 4

array = 0;
y = pi;
row = 0;
col = .5;

f=[30*cos(theta);0;20*sin(2*theta)];
velocity=diff(f,theta,1);


while n < 2

        for newstep = 0 : pi/50 : 2*pi/1
            
            location=subs(f,theta,newstep);
            direction=subs(velocity,theta,newstep);
            y = pi+ atan2(direction(3,1),direction(1,1));
            tx1 = location(1,1)-15;
            ty1 = location(2,1);
            tz1 = 5+location(3,1);
            DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
            carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);                   
        end
    
    
       
  n = n + 1
    
end
pause off