echo off
syms theta
f=position(theta); 
velocity=diff(f,theta,1);





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

Trans = [1 0 0 0; 0 1 0 0; 0 0 1 1; 0 0 0 1] * dCar; % pushes DP1 off the origan 






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




for newstep = 0 : -pi/50 : -4*pi/1
    location=subs(f,theta,newstep);
    direction=subs(velocity,theta,newstep);
    phi = atan2(direction(2,1),direction(1,1))
    
   
    
    
    T  = [1 0 0 (80*cos(newstep)); 0 1 0 ty1; 0 0 1 (40*sin(2*newstep)); 0 0 0 1];
    
    
    
    S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix

    Rx = [1 0 0            0; 0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
    Ry = [cos(phi) 0 -sin(phi) 0; 0 1 0 0; sin(phi) 0 cos(phi) 0;0 0 0 1];     % y Rotation matrix
    Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0  0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix

    P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
    DP = S*T*Rx*Ry*Rz*Trans;    
    D3 = horzcat(DP);

    Dpro = P * D3;  
    GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
    GP2 = GP1(1:2,:);
    D2T = transpose(GP2);
    gplot(Zall,D2T,'K')
    axis ([wxmin wxmax,wymin wymax])
    pause(pse) 
    
end
