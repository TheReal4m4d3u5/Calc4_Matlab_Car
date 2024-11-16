pause on
b =  -30;           % x perspective view
c = 30;            % y perspective view
d = 70;            % z perspective view
x = 0;             % x theta
z = 0;             % z theta 
tx = 0;            % x location
ty = 0;            % y location
tz = 0;            % z location 
sx = 1;            % x scaling factor
sy = 1;            % y scaling facotr
sz = 1;            % z scaling facotr


wxmin = -60;
wxmax = 35;
wymin = -20;
wymax = 20;



n = 0;             % # of loops
inc = pi/24;       % theta rotaion inc
inc2 = 2.3;
pse = .001;        % pause delay 



dCar = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
0 0 2.5 2.5 2.5 2.5 4 4 4 4 2.5 2.5 2.5 2.5 0 0;
-2.5 2.5 2.5 -2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 2.5 -2.5;
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

height = 10;


dBuild = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 height height height height; 0 0 10 10 0 0 10 10; 
    1 1 1 1 1 1 1 1];

dBoarder = [

 5    6   7     8    9    10   11    12   13    14  15    16  17    18 19     20    20     20   20    20  20    20  20    20  20    20  20    20  20    20  20   20   -40  -41  -42 -43 -44 -45 -46 -47 -48 -49 -50 -50 -50 -50 -50  -50    -50      -50    -50    -50 -50      -50   -50      -50 -50      -50 -50      -50   -50   -50   -50 -50 ;
 0    0   0     0    0     0    0     0    0     0   0     0   0     0  0      0     0      0    0     0   0     0   0     0   0     0   0     0   0     0   0    0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0    0      0        0      0      0   0        0     0        0   0        0   0        0     0     0     0   0 ;
20 19.5  19  18.5   18  17.5   17  16.5   16  15.5  15  14.5  14  13.5 13   12.5   -40    -41  -42   -43 -45   -47 -49   -51 -53   -55 -55   -55 -55   -55 -55  -55   -55  -55  -55 -55 -55 -55 -55 -55 -55 -55 -55 -55 -55 -55 -55  -55     12     12.5     13   13.5  14     14.5    15     15.5  16     16.5  17     17.5  18.5    19  19.5  20;    
 1    1   1     1    1     1    1     1    1     1   1     1   1     1  1      1     1      1    1     1   1     1   1     1   1     1   1     1   1     1   1    1     1    1    1   1   1   1   1   1   1   1   1   1   1   1   1    1      1        1      1      1   1        1     1        1   1        1   1        1     1     1     1   1];




DP2 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dBuild;
DP3 = [1 0 0 0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
DP4 = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild;
DP5 = [1 0 0 -30; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dBuild;



Trans = [1 0 0 0; 0 1 0 0; 0 0 1 -15; 0 0 0 1] * dCar; % pushes DP1 off the origan 



D = [
 0  1  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   1 ; 
 1  0  1  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0 ;  
 0  1  0  1   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   0   0;
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


Znew = zeros(48,64);
Znew1 = zeros(64,8);
Znew2 = zeros(64,16);
Z = zeros(8,8);
Zhorz = horzcat(Z,Z); % 8 x 16
Zvert = vertcat(Z,Z); % 16 x 8
Z3 = vertcat(A,Zhorz,Zhorz,Zhorz,Zhorz,Znew2);   %32 x 16 1 block of aj  
Z4 = vertcat(Zvert,B,Zvert,Z,Znew1);           % 32 x 8 2nd block of aj
Z5 = vertcat(Zvert,Z,B,Z,Z,Znew1);           % 32 x 8 3rd block of aj
Z6 = vertcat(Zvert,Zvert,B,Z,Znew1);         %32 x 8 4th block of aj
Z7 = vertcat(Zvert,Zvert,Z,B,Znew1);
Z8 = vertcat(Znew,D);
Zall = horzcat(Z3,Z4,Z5,Z6,Z7,Z8);         %entire ajacinty martic
d1 = 0;
d2 = 0;
d3 = 0;
d4 = 0;
d5 = 0;
d6 = 0;
d7 = 0;
d8 = 0;
d9 = 0;
d10 = 0;
d11 = 0;
d12 = 0;
d13 = 0;
d14 = 0;
d15 = 0;
d16 = 0;





decision = 1;

while n < 1

   
    if decision == 1
        

        
        n = n + 1;
        
        rand = 1;
        
        if rand == 1 
            y = pi;
            
            
            while y <= .5*pi
                DP = carMove( x,y,z,tx1,tx2,tx3,ty1,ty2,ty3,tz1,tz2,tz3,sx,sy,sz,Trans); 
                carPrintFunction(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP2,DP3,DP4,DP5,dBoarder,Zall);
                                
                y = y + (inc);
%                 decision = 2;
  
            end
            n = n +1;
        end

        if rand == 2
            while y <= .5*pi
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                decision = 3;
            end
        end
        
        if rand == 3
            count = 0;
            while count >= -30
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count - inc2;
                decision = 5;
            end
        end   
    end
    
    
    if decision == 2
        d2 = d2 + 1;
        rand = randi(3,1);
        y = .5*pi;
        if rand == 1 
            while y <= 3/2 * pi 
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                decision = 9;
              
            end       
        end

        if rand == 2
            y = .5*pi;
            while y <= 3/2 * pi 
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                decision = 13;
            end
        end
        
        if rand == 3
            count = 0;
            y = .5*pi;
            while count >= -15
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count - inc2;
            end
            
            
            count = 45;
            
            while count >= 30
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count - inc2;
                
            end
            decision = 7;
        end
        
        
        
        
            
    end
    
    if decision == 3
        d3 = d3 +1;
        rand = randi(3,1);
           y = pi/2;
        if rand == 1 
            while y <= 3*pi /2
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                
             
                decision = 11;
            end
     
        end

        if rand == 2
            while y <= 3*pi/2
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                
             
            end
%                n = n +1;
                decision = 15;
        end
        
        
        if rand == 3
            count = 0;
            y = -.5*pi;
            while count <= 15
                               DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count + inc2;
            end
            
            count = -45;
            
            while count <= -30
                   DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count + inc2;
            end
            decision = 6;
        end
    end
    
    if decision == 4
        d4 = d4+1;
        y = 0;
        rand = randi(3,1);
       
        if rand == 1 
            while y <= .5*pi
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                decision = 3;
           
            end
        end

        if rand == 2
            while y <= .5*pi
                        DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                decision = 2;
            end
        end
        
        if rand == 3
            count = 30;
            while count >= 0
                         DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count -inc2;
                decision = 8;
            end
        end
    end
    
     if decision == 5
         d5=d5+1;
        y = 0;
        rand = randi(3,1);
        
        if rand == 1; 
            while y <= pi
                      DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                
               
               
                decision = 12;
            end
            
            
            
            
        end

        if rand == 2
            while y <= pi
                           DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
                
            
                decision = 14;
            end
    
        end
        
        
        if rand == 3
            y = pi;
            count = 30;
            while count <= 45
                
                        DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count +inc2;
             
            end
            
            count = -15;
                       
            while count <= 0
                
                  DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                count = count +inc2;
               
            end
            decision = 1;
        end
     end
    
     
      if decision == 6
       d6=d6+1;
        rand = randi(3,1);
       
        if rand == 1 
             y =  -.5*pi;
            while y <= 0
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(b,c,d,pse,wxmin,wxmax,wymin,wymax,Zall, DP, dB0,dB1,dB2,dB3,dBoard0);
                y = y + (inc);
               decision = 5;
            end
        end

        if rand == 2
            y = -.5*pi;
            while y <= 0
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                

%                                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                decision = 8;
            end
        end
        
        if rand == 3
            count = 0;
            y = -.5*pi;
            while count <= 30
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 count; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                
%                                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                count = count + inc2;
                decision = 3;
            end
        end
      end
    
      
       if decision == 7
           d7 = d7+1;
        rand = randi(3,1);
  
        if rand == 1 
             y = -.5*pi;
            while y <= 0
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 sin(y) tx;0 1 0 ty;-sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                
%                                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                decision = 8;
               
            end
        end

        if rand == 2
             y = -.5*pi;
            while y <= 0
                T  =  [1 0 0 -30; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 sin(y) tx;0 1 0 ty;-sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                
%                                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
               
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                decision = 5;
            end
        end
        
        if rand == 3
            y = .5*pi;
            count = 0;
            
            while count >= -30
                T  =  [1 0 0 -30; 0 1 0 ty; 0 0 1 count; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 -tz; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(1.5*pi) 0 sin(1.5*pi) tx;0 1 0 ty;-sin(1.5*pi) 0 cos(1.5*pi) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
                
                
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                count = count -inc2;
                decision = 2;
            end
        end
       end
    
       
        if decision == 8
            d8=d8+1;
        y = 0;
        rand = randi(2,1);
       
        if rand == 1 
            while y <= pi
           
                T  =  [1 0 0 tz; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 sin(y) tx;0 1 0 ty;-sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                
%                                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
%                 n = n +1;
                decision = 10;
                
            end
            
        end

        if rand == 2
            while y <= pi
               T  =  [1 0 0 tx; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                
                
%                 
%                                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
                
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
                
                
                decision = 16;
            end
        end
        end
    
        if decision == 9;
            d9=d9+1;
        y = 3*pi /2;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y <= 2 * pi 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
         
                end

                decision = 1;  
            
        end

        if rand == 2
            t = -30;
               while t <= 0 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 t; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                              
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t + 1.5;
               end
               
                while y <= (2 * pi) + (pi/2) 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
                decision = 7;    
                end             
        end

        end 
        
        
        
        if decision == 10;
            d10=d10+1;
        y = 0;
     
        rand = randi(2,1);
       
       if rand == 1 
                while y <= pi/2  
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);              
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                end
                
                decision = 7;
        end

        if rand == 2
            t = 0;
               while t >= -30 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                
                T2 =  [1 0 0 t; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t - 1.5;
               end
               
                while y <= pi/2
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 -30; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                decision = 11;
                end
               
               
        end

        end 
        
        if decision == 11;
            d11=d11+1;
        y = pi/2;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y <= pi  
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 -30; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
                
               
                end
          
                decision = 4; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end

        if rand == 2
            t = 0;
               while t >= -30 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                
                T2 =  [1 0 0 -60; 0 1 0 ty; 0 0 1 t; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t - 1.5;
               end
               
                while y <= pi
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 -30; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                decision = 12;
                end
               
               
        end

        end
        
        if decision == 12;
            d12 = d12+1;
        y = pi;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y <= 3*pi/2  
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 -30; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                end
            
                decision = 6; %
        end

        if rand == 2
            t = -30;
               while t <= 0 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                
                T2 =  [1 0 0 t; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t + 1.5;
               end
               
                while y <= 3*pi/2
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 0; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
                end
               
               decision = 9;
        end

        end
        
        if decision == 13;
            d13=d13+1;
        y = 3*pi / 2;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y <= 2*pi  
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 30; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
%                 n = n+1;
                decision = 4; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                end
            
        end

        if rand == 2
            t = -30;
               while t <= 0 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                
                T2 =  [1 0 0 -60; 0 1 0 ty; 0 0 1 t; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t + 1.5;
               end
               
                while y <= 2 * pi
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 30; 0 0 0 1];
                T2 =  [1 0 0 30; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
               
                S  =  [-sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                          
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y + (inc);
                
                end
               
               decision = 14;
        end
        end
        
        if decision == 14;
            d14=d14+1;
        y = pi;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y >= pi/2  
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 30; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [sx 0 0 -60;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y - (inc);
                
              
                end
               
          
              decision = 7; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end

        if rand == 2
            t = -30;
               while t <= 0 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                
                T2 =  [1 0 0 t; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t + 1.5;
               end
               
                while y >= pi/2
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 0; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y - (inc);
                
                end
               
               
               decision = 15;
        end

        end
        
        if decision == 15;
            d15=d15+1;
        y = pi/2;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y >= 0  
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 0; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y - (inc);
   
                end
            
              decision = 1; 
        end

        if rand == 2
            t = 0;
               while t >= -30 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                
                T2 =  [1 0 0 0; 0 1 0 ty; 0 0 1 t; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t - 1.5;
               end
               
                while y >= 0
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 0; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y - (inc);
                
                end
               
               
               decision = 16;
        end

        end
        
        if decision == 16;
            d16 = d16+1;
        y = 0;
     
        rand = randi(2,1);
       
        if rand == 1 
                while y >= -pi/2 
                T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 0; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y - (inc);
                
              
                end
               
           decision = 6;
              
        end

        if rand == 2
            t = 0;
               while t >= -30 
               T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 t; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
               
                
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
               
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                
                t = t - 1.5;
               end
               
                while y >= -pi/2
               T  =  [1 0 0 0; 0 1 0 ty; 0 0 1 tz; 0 0 0 1];
                T1 =  [1 0 0 tx; 0 1 0 ty; 0 0 1 0; 0 0 0 1];
                T2 =  [1 0 0 t; 0 1 0 ty; 0 0 1 -30; 0 0 0 1];
               
                S  =  [sx 0 0 0;0 sy 0 0;0 0 sz 0;0 0 0 1];                           % Shear Matrix
                
                Rx = [1 0 0 0;0 cos(x) -sin(x) 0; 0 sin(x) cos(x) 0; 0 0 0 1];      % x Rotation matrix
                Ry = [cos(y) 0 -sin(y) tx;0 1 0 ty;sin(y) 0 cos(y) tz;0 0 0 1];     % y Rotation matrix
                Rz = [cos(z) -sin(z) 0 0; sin(z) cos(z) 0 0; 0 0 1 0 ; 0 0 0 1];    % z Rotation matrix
                P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1];                    % Projection matrix
                DP = S*T*Rx*T2*Ry*T1*Rz*Trans;                                            % 
                D3 = horzcat(DP, DP2, DP3, DP4,DP5,dBoarder);
                
%                 Bnew = D3(1,1);
%                 Dnew = D3(3,1);
%                 
%                 b = -13.5 + Bnew;
%                 d = 87.5 + Dnew;
%                 
                Dpro = P * D3;  
                GP1 = Dpro(1:3,:)./[Dpro(4,:);Dpro(4,:);Dpro(4,:)];
                GP2 = GP1(1:2,:);
                D2T = transpose(GP2);
                gplot(Zall,D2T,'K')
                axis ([wxmin wxmax,wymin wymax])
                pause(pse)
                y = y - (inc);
                
                end
               
%               n = n +1;
               decision = 13;
        end

        end
          
end
pause off




