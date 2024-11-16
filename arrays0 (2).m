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

Trans = [1 0 0 0; 0 1 0 0; 0 0 1 -15; 0 0 0 1] * dCar; % pushes DP1 off the origan 

height = 10;
dBuild = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 height height height height; 0 0 10 10 0 0 10 10; 
    1 1 1 1 1 1 1 1];


D = [
 0  1  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   1 ; 
 1  0  1  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ;  
 0  1  0  1   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;        % 64 x 64                                
 0  0  1  0   1  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  1   0  1  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   1  0  1  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  1  0  1  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  1  0  1  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  1  0  1  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 
 0  0  0  0   0  0  0  0  1  0  1 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  1  0 1   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  1 0   1  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  0 1   0  1  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  0 0   1  0  1  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  0 0   0  1  0  1    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  1  0    1    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  1    0    1     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    1    0     1   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    1     0   1   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     1   0   1   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;   
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   1   0   1   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   1   0   1   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   1   0   1   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   1   0   1   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   1   0   1   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   1   0   1   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   1   0   1   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   1   0   1   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   1   0   1   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0  ;
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   1   0   1   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   1   0   1     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0  ;
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   1   0     1    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   1     0    1    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     1    0    1   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    1    0   1   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    1   0   1   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   1   0   1   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0  ;
 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   1   0   1   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   1   0   1   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   1   0   1   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   1   0   1   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   1   0   1   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   1   0   1   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   1   0   1   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   1   0   1   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   1   0   1   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   1   0   1   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   1   0   1    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   1   0    1   0   0   0   0   0   0   0   0   0    0   0   0   0   0;  
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   1    0   1   0   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    1   0   1   0   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   1   0   1   0   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   1   0   1   0   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   1   0   1   0   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   1   0   1   0   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   1   0   1   0   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   1   0   1   0    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   1   0   1    0   0   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   1   0    1   0   0   0   0  ;
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   1    0   1   0   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    1   0   1   0   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   1   0   1   0 ; 
 0  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   1   0   1;
 1  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   1   0 ] ;


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






% tx1 = -30;
tx2 = 0;
tx3 = 0;
ty1 = 0;
ty2 = 0;
ty3 = 0;
% tz1 = 0;
tz2 = 0;
tz3 = 0;
n;
% function1 = 4

array = 0;
y = pi/2;
row = .5;
col = 0;

while n < 2
    
    if array == 0
        DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP1 = [1 0 0    0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP2 = [1 0 0  -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP3 = [1 0 0  -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP4 = [1 0 0   30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP5 = [1 0 0   30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP6 = [1 0 0   30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP7 = [1 0 0    0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP8 = [1 0 0  -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    end
    if array == -1
        DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP1 = [1 0 0    0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP2 = [1 0 0  -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP3 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP4 = [1 0 0   30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP5 = [1 0 0   30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP6 = [1 0 0   30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP7 = [1 0 0    0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP8 = [1 0 0  -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    end
    if array == 1
        DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP1 = [1 0 0    0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP2 = [1 0 0  -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP3 = [1 0 0  -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP4 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP5 = [1 0 0   30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP6 = [1 0 0   30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP7 = [1 0 0    0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP8 = [1 0 0  -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    end
    if array == 3
        DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP1 = [1 0 0    0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP2 = [1 0 0  -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP3 = [1 0 0  -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP4 = [1 0 0   30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP5 = [1 0 0   30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP6 = [1 0 0   30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP7 = [1 0 0    0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP8 = [1 0 0  -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    end
    if array == 4
        DP0 = [1 0 0    0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP1 = [1 0 0    0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP2 = [1 0 0  -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP3 = [1 0 0  -30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP4 = [1 0 0   30; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild;
        DP5 = [1 0 0   30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
        DP6 = [1 0 0   30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP7 = [1 0 0    0; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
        DP8 = [1 0 0  -30; 0 1 0 0; 0 0 1  40; 0 0 0 1] * dBuild;
    end

    
    
    
    if row < -1
        row = 1.5;
        
    end
    if row > 2
        row = -.5;
    end
    if col < -1
        col = 1.5;
        array = 1;
    end
    if col > 2
        col = -.5;
        array = -1;
    end
    
    if array < -1
        array = 1;
    end
    if array > 1
        array = -1;
    end
    
    
    
    
    
%     face check & function choice
    
    if  y == 0
        
        rand = randi(3,1);
        if rand == 1
            function1 = 1; 
        end
        
        if rand == 2
            function1 = 5;
            tz2 =30;
        end
        
        if rand == 3
            function1 = 9;
        end
        
    end
        
    if  y == pi
        
        rand = randi(3,1);

        if rand == 1
            function1 = 2; 
        end
        
        if rand == 2
            function1 = 6;
            tz2 = 30;
        end
        
        if rand == 3
            function1 = 10;
        end
        
    end


    if  y == pi/2
        
        rand = 3
        if rand == 1
            function1 = 3; 
        end
        
        if rand == 2
            function1 = 7;
            tz2 = 30;
        end
        
        if rand == 3
            function1 = 11;
            tz2 = 0;
        end
        
    end

    if  y == 3*pi/2
        
        rand = randi(3,1);

        if rand == 1
            function1 = 4; 
        end
        
        if rand == 2
            function1 = 8;
               tz2 = 30;
        end
        
        if rand == 3
            function1 = 12;
        end
        
    end


    
    
 
     
% %     %check face and tz2 to assign row & column to a value
  
    if y == 0  && tz2 == 0 
        
        tz1 = 40 * row;
        
        if col == -.5
            n = -1;
        end
        if col == .5
            n = 0;
        end
        if col == 1.5
            n = 1;
        end
        
        tx1 = 30*n;
        
    end



    if y == pi && tz2 == 0 
        
        tz1 = row*40 - 30;
     
        if col == -.5
            tx1 = -30;
        end
        if col == .5
            tx1 = 0;
        end
        if col == 1.5
            tx1 = 30;
        end
    end
    
    

    

    
    if y == pi/2 && tz2 == 0  
        
        tx1 = col*30 -30;
            
        if row == -.5
            tz1 = -40;
        end
        if row == .5
            tz1 = 0;
        end
        if row == 1.5
            tz1 = 40;
        end
    end
    
        
    if y == 3*pi/2 && tz2 == 0      
    
        tx1 = col*30;

        if row == -.5
            tz1 = -30;
        end
        if row == .5
            tz1 = 10;
        end
        if row == 1.5
            tz1 = 50;
        end
    end



    
    if y == 0  && tz2 == 30 

        tz1 = row * 40 -40;

        if col == -.5
            tx1 = -30;
        end
        if col == .5
            tx1 = 0;
        end
        if col == 1.5
            tx1 = 30;
        end
    end
    


    if y == pi && tz2 == 30 
            
        tz1 = row*40;
        
        if col == -.5
            tx1 = -30;
        end
        if col == .5
            tx1 = 0;
        end
        if col == 1.5
            tx1 = 30;
        end
    end

    if y == pi/2 && tz2 == 30 
      
        tx1 = col*30;
     
        if row == -.5
            tz1 = -40;
        end
        if row == .5
            tz1 = 0;
        end
        if row == 1.5
            tz1 = 45;
        end
    end
    
        
    if y == 3*pi/2 && tz2 == 30      
        if col == 0
            tx1 = -30;
        end
        if col == 1
            tx1 = 0;
        end
        if col == -1
            tx1 = -60;
        end
        if col == 2
            tx1 = 30;
        end
        if row == -.5
            tz1 = -30;
        end
        if row == .5
            tz1 = 15;
        end
        if row == 1.5
            tz1 = 45;
        end
    end
    

    
    %After determiniing functon and assinging cordinate values passes
    %values to function 

   
 
    
    if function1 == 1
        var = 0;
        y = 0;
        while var <= 12             % no matter where car is increment 
            
                if tx1 <= -45
                    tx1 = 45;
                    array = array -1;
                end
%                 x = x + 1;             % x theta
                tx1 = tx1 - inc2;
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    
                var = var + 1;
        end 
        col = col -1;
    end
    
    
    if function1 == 2
         
        y = pi;     
        var = 0;
        while var <= 12            % no matter where car is increment 
            
                if tx1 >= 41 
                    tx1 = -46;
                    array = array +1;
                end

                tx1 = tx1 + inc2;
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    

                var = var + 1;
        end
        col = col +1;
    end
    
    
    if function1 == 3              
        
        y = pi/2;            
        var = 0;
        
        while var <= 17             % no matter where car is increment 
            
                if tz1 <= -45 
                    tz1 = 75;
                end

                tz1 = tz1 - inc2;

                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    

                var = var + 1;
        end
        row = row -1;
    end
    
    
    
    
    if function1 == 4 
        
        y = 3*pi/2;         
        var = 0;

        while var <= 14            % no matter where car is increment 
            
                if tz1 >= 60 
                    tz1 = -55;
                end

                tz1 = tz1 + inc2;

                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    
                var = var +1;
        end
        row = row +1;
    end
    
    
    
    if function1 == 5

             y = 0;
%              tx1 = 0;
%              tz1 = -30;
             tz2 = 30;             % flips car correct dirrecttion  

            while y <= pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                        
                      y = y + inc;
            end
            col = col -.5;
            row = row -.5;

            y = pi/2;
            tz2 =0;
    end
    
    
    if function1 == 6
        
             y =   pi;
%              tx1 = 0;
%              tz1 = -30;
             tz2 = 30;             % flips car correct dirrecttion  
      
            while y <= 3*pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                        
                      y = y + inc;
            end
            col = col +.5;
            row = row +.5;

            y = 3*pi/2;
            tz2 =0;
    end
    
    
    if function1 == 7
               
             y =   pi/2;
%              tx1 = 0;
%              tz1 = -30;
             tz2 = 30;             % flips car correct dirrecttion  
    
            while y <= pi
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                        
                      y = y + inc;
            end
            
            col = col +.5;
            row = row -.5;
            y = pi;
            tz2 =0;
    end
    
    
    if function1 == 8
       
             y =   3*pi/2;
%              tx1 = 0;
%              tz1 = -30;
             tz2 = 30;             % flips car correct dirrecttion  
 
            while y <= 2*pi
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                        
                      y = y + inc;
            end
            
            col = col -.5;
            row = row +.5;
            y = 0;
            tz2 =0;
    end
    
    
    if function1 == 9
        
                
        y = 2*pi;
%         tx1 = 0;
%         tz1 = -30;

        
        while y >= 3*pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                y = y - (inc);
        end
         
        col = col -.5;
        row = row +.5;
        y = 3*pi/2;
        
    end
    
    
    if function1 == 10
                  
        y = pi;
%         tx1 = 0;
%         tz1 = -30;
   
        
        while y >= pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                y = y - (inc);
        end
     col = col +.5;
     row = row -.5;
     y = pi/2; 
    end
    
    
    if function1 == 11      
        y = pi/2;
%         tx1 = 0;
%         tz1 = -30;
   
        
        while y >= 0
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                y = y - (inc);
        end
        
        row = row -.5;
        col = col -.5;
        y = 0;
        
    end
    
    
    
    if function1 == 12
        y = -pi/2;
%         tx1 = 0;
%         tz1 = -30;

        
        while y >= -pi
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                y = y - (inc);
               
        end;
        col = col +.5;
        row = row +.5;
         y = pi;
    end
    
    
    col
    row
    y 
    
    
    
%     colA = col
%     rowA = row
%     yA   = y 
%                             
  
          
  n = n + 1;
    
end
pause off