echo off
syms theta
pause on




b =  0;           % x perspective view
c = 30;            % y perspective view
d = 70;            % z perspective view


x = 0;             % x theta
y = 0;
z = 0;             % z theta 


ty1 = 0;            % y location

tx2 = 0;
ty2 = 0;
tz2 = 0;
tx3 = 0;
ty3 = 0;
tz3 = 0;

sx = 1;            % x scaling factor
sy = 1;            % y scaling facotr
sz = 1;            % z scaling facotr


wxmin = -190;
wxmax = 190;
wymin = -50;
wymax = 20;


inc = pi/24;       % theta rotaion inc
inc2 = 2.3;
pse = .001;        % pause delay 



dCar = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
0 0 2.5 2.5 2.5 2.5 4 4 4 4 2.5 2.5 2.5 2.5 0 0;
-2.5 2.5 2.5 -2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 2.5 -2.5;
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

Trans = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dCar; % pushes DP1 off the origan 






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


Zall = horzcat(A);         %entire ajacinty martic

f = 1;
n = 0;

while n < 1
    if f == 0
        f=[80*cos(theta);0;40*sin(2*theta)]; 
    end
    if f == 1
        f=[10*cos(theta);0;10*sin(theta)]; 
    end
    
    for newstep = 0 : pi/50 : 2*pi/1

        velocity=diff(f,theta,1);
        location=subs(f,theta,newstep);
        direction=subs(velocity,theta,newstep);
        phi = pi + atan2(direction(3,1),direction(1,1));
        tx1 = location(1,1);
        ty1 = location(2,1);
        tz1 = 5+location(3,1);
        
        

        DP = carFunction3(x,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans,phi); 
        carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    

    end  
    f = f +1;
    n = n +1;
end
