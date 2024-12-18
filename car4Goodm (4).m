pause on
b = -40;           % x perspective view
c = 30;            % y perspective view
d = 80;            % z perspective view
x = 0;             % x theta
z = 0;             % z theta 
tx = 0;            % x location
ty = 0;            % y location
tz = 0;            % z location 
sx = 1;            % x scaling factor
sy = 1;            % y scaling facotr
sz = 1;            % z scaling facotr
n = 0;             % # of loops
inc = pi/48;       % theta rotaion inc
inc2 = 1;
pse = .001;        % pause delay 
wxmin = -60;
wxmax = 35;
wymin = -20;
wymax = 20;
tx1 =0;
ty1 = 0;
tz1 = 0;
tx2= 0;
ty2 = 0;
tz2 = 0;
tx3 = 0;
ty3 = 0;
tz3 = 0;


dCar0 = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25  4.5 4.5  6.5 6.5 6.5    6.5   -0.75  -0.75 3.25  3.25    2      2;
         0    0  2.5  2.5  2.5  2.5    4    4    4    4  2.5 2.5  2.5 2.5   0    0      1.25   1.25 1.25  1.25    1.25   1.25;
      -2.5  2.5  2.5 -2.5 -2.5  2.5 -2.5  2.5 -2.5  2.5 -2.5 2.5 -2.5 2.5 2.5   -2.5    2.5   -2.5  2.5  -2.5     10    -10;
       1    1    1    1    1    1    1    1    1    1    1   1    1   1   1      1      1      1    1     1        1      1 ];



dBuild0 = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 10 10 10 10; 0 0 10 10 0 0 10 10; 
    1 1 1 1 1 1 1 1];

dB0 = [1 0 0   0; 0 1 0 0; 0 0 1   0; 0 0 0 1] * dBuild0;
dB1 = [1 0 0   0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild0;
dB2 = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild0;
dB3 = [1 0 0 -30; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dBuild0;


Trans = [1 0 0 0; 0 1 0 0; 0 0 1 -15; 0 0 0 1] * dCar0; % pushes DP1 off the origan 


dBoard0 = [5    6   7     8    9    10   11    12   13    14  15    16  17    18 19     20    20     20   20    20  20    20  20    20  20    20  20    20  20    20  20   20   -40  -41  -42 -43 -44 -45 -46 -47 -48 -49 -50 -50 -50 -50 -50  -50    -50      -50    -50    -50 -50      -50   -50      -50 -50      -50 -50      -50   -50   -50   -50 -50 ;
 0    0   0     0    0     0    0     0    0     0   0     0   0     0  0      0     0      0    0     0   0     0   0     0   0     0   0     0   0     0   0    0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0    0      0        0      0      0   0        0     0        0   0        0   0        0     0     0     0   0 ;
20 19.5  19  18.5   18  17.5   17  16.5   16  15.5  15  14.5  14  13.5 13   12.5   -40    -41  -42   -43 -45   -47 -49   -51 -53   -55 -55   -55 -55   -55 -55  -55   -55  -55  -55 -55 -55 -55 -55 -55 -55 -55 -55 -55 -55 -55 -55  -55     12     12.5     13   13.5  14     14.5    15     15.5  16     16.5  17     17.5  18.5    19  19.5  20;    
 1    1   1     1    1     1    1     1    1     1   1     1   1     1  1      1     1      1    1     1   1     1   1     1   1     1   1     1   1     1   1    1     1    1    1   1   1   1   1   1   1   1   1   1   1   1   1    1      1        1      1      1   1        1     1        1   1        1   1        1     1     1     1   1];

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
 1  0  0  0   0  0  0  0  0  0  0 0   0  0  0  0    0    0     0   0   0   0   0   0   0   0   0   0   0   0   0   0     0    0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0    0   0   0   0   0   0   0   0   0   0    0   0   0   1   0 ];



A = [0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0;
     1 0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
     0 1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     1 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 1 1 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0;
     1 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0];
 
 
 
B = [0 1 0 1 1 0 0 0;
1 0 1 0 0 1 0 0;
0 1 0 1 0 0 1 0;
1 0 1 0 0 0 0 1;
1 0 0 0 0 1 0 1;
0 1 0 0 1 0 1 0;
0 0 1 0 0 1 0 1;
0 0 0 1 1 0 1 0];

Znew = zeros(8,22);
Znew1 = zeros(22,8);
Znew2 = zeros(8,8);
Znew3 = zeros(64,22);
Znew4 = zeros(64,8);
Znew5 = zeros(54,64);



Z3 = vertcat(A,Znew,Znew,Znew,Znew,Znew3);   %32 x 16 1 block of aj  
Z4 = vertcat(Znew1,B,Znew2,Znew2,Znew2,Znew4);           % 32 x 8 2nd block of aj
Z5 = vertcat(Znew1,Znew2,B,Znew2,Znew2,Znew4);           % 32 x 8 3rd block of aj
Z6 = vertcat(Znew1,Znew2,Znew2,B,Znew2,Znew4);         %32 x 8 4th block of aj
Z7 = vertcat(Znew1,Znew2,Znew2,Znew2,B,Znew4);
Z8 = vertcat(Znew5,D);
Zall = horzcat(Z3,Z4,Z5,Z6,Z7,Z8) ;        %entire ajacinty martic


function1 = 1

while n < 1

    carLeftFour( inc2,x,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sy,sz,Trans,pse,wxmin,wxmax,wymin,wymax,dB0,dB1,dB2,dB3,Zall,P)
  n = n+1;
end

pause off
    
    
    
    




