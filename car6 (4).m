%Avery Jacobson
%2520 Calculus 4 James Carr
%Car program


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
inc = pi/12;       % theta rotaion inc
inc2 = 2.5;
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


DP1 = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25  4.5 4.5  6.5 6.5 6.5    6.5   -0.75  -0.75 3.25  3.25        2      2;
          0    0  2.5  2.5  2.5  2.5    4    4    4    4  2.5 2.5  2.5 2.5   0      0    1.25   1.25 1.25  1.25     1.25   1.25;
       -2.5  2.5  2.5 -2.5 -2.5  2.5 -2.5  2.5 -2.5  2.5 -2.5 2.5 -2.5 2.5 2.5   -2.5    2.5   -2.5  2.5   -2.5       10    -10;
          1    1    1    1    1    1    1    1    1    1    1   1    1   1   1      1      1      1    1      1        1      1];

DP2 = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 10 10 10 10; 0 0 10 10 0 0 10 10; 1 1 1 1 1 1 1 1];

DP3 = [1 0 0 0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * DP2;
DP4 = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * DP2;
DP5 = [1 0 0 -30; 0 1 0 0; 0 0 1 0; 0 0 0 1] * DP2;
Trans = [1 0 0 0; 0 1 0 0; 0 0 1 -15; 0 0 0 1] * DP1; % pushes DP1 off the origan 

DP6 = [5    6   7     8    9    10   11    12   13    14  15    16  17    18 19     20    20     20   20    20  20    20  20    20  20    20  20    20  20    20  20   20   -40  -41  -42 -43 -44 -45 -46 -47 -48 -49 -50 -50 -50 -50 -50  -50    -50      -50    -50    -50 -50      -50   -50      -50 -50      -50 -50      -50   -50   -50   -50 -50 ;
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

Z3 = vertcat(A,Znew,Znew,Znew,Znew,Znew3);     
Z4 = vertcat(Znew1,B,Znew2,Znew2,Znew2,Znew4);           
Z5 = vertcat(Znew1,Znew2,B,Znew2,Znew2,Znew4);           
Z6 = vertcat(Znew1,Znew2,Znew2,B,Znew2,Znew4);         
Z7 = vertcat(Znew1,Znew2,Znew2,Znew2,B,Znew4);
Z8 = vertcat(Znew5,D);
Zall = horzcat(Z3,Z4,Z5,Z6,Z7,Z8) ;        %entire ajacinty martic

P = carPFunction(b,c,d);


decision = 1

while n < 1
   
    if decision == 1
       
        rand = randi(3,1)
    
        if rand == 1 
             y =   0;
             tx1 = 0;
             tz1 = 0;
             tz2 = 30;
             tz3 = -30; 
             sx = 1;
            while y <= .5*pi
                      [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                      [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                        
                      y = y + inc;
            end
                decision = 2;
        end

        if rand == 2
             y =   0;
             tx1 = 0;
             tz1 = 0;
             tz2 = 0;
             tz3 = 0; 
             sx = 1;
            while y >= -.5*pi
                     [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                     [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                     
                     y = y - inc;
                 
            end
            decision = 3;
        end
        
        if rand == 3
             y =   0;
             tx1 = 0;
             tz1 = 0;
             tz2 = 0;
             tz3 = 0; 
             sx = 1;
            while tx1 >= -30
                    [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                    [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                    
                    tx1 = tx1 - inc2;
            end
            
                decision = 5;
        end   
    end
    
    
    if decision == 2
        rand = randi(2,1)
        
        if rand == 1 
             y = .5*pi;
             tx1 = 0;
             tz1 = 0;
             tz2 = 30;
             tz3 = -30;   
             sx = 1;
            while y <= 2*pi 
                [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
              
                y = y + inc;
            end
            n = n + 1
            decision = 1; 
        end

        if rand == 2
            y = .5*pi;
             tx1 = 30;
             tz1 = 0;
             tz2 = 30;
             tz3 = -30;   
             sx = -1;
            while y <= 2*pi 
                [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                y = y + inc;
            end
             decision = 4; 
        end
    end
    
    if decision == 3
        rand = randi(2,1)
       
        if rand == 1 
              y = -.5*pi;
              tx1 = 30;
              tz1 = 0;
              tz2 = 0;
              tz3 = 0; 
              sx = -1;
            while y >= -2*pi
                 [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                 [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                 y = y - inc;
            end
            
            decision = 4; 
     
        end

        if rand == 2
            y = -.5*pi;
              tx1 = 0;
              tz1 = 0;
              tz2 = 0;
              tz3 = 0; 
              sx = 1;
            while y >= -2*pi
                [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                y = y - inc;
            end
             decision = 1;
              n = n + 1
        end
    end
    
    if decision == 4
        rand = randi(3,1);
       
        if rand == 1 
            y = 0;
            tx1 = 30;
            tz1 = 0;
            tz2 = 0;
            tz3 = 0;
            sx = -1;
            
            while y >= -.5*pi
                [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                y = y - inc;
            end
            decision = 3; 
        end

        if rand == 2
            y = 0;
            tx1 = 30;
            tz1 = 0;
            tz2 = 30;
            tz3 = -30;
            sx = -1;
            
            while y <= .5*pi
                 [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                 [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                 y = y + inc;
            end
             decision = 2;
            
        end
        
          if rand == 3
             y =   0;
             tx1 = 30;
             tz1 = 0;
             tz2 = 0;
             tz3 = 0; 
             sx = -1;
            while tx1 >= 0
                     [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                     [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                     tx1 = tx1 - inc2;
            end
            
                decision = 8;
           end 
    end
    
     if decision == 5
        
         rand = randi(2,1)
        
        if rand == 1 
            y = 0;
            tx1 = -30;
            tz1 = 0;
            tz2 = 30;
            tz3 = -30;
            sx = 1; 
            while y <= 1.5*pi
                 [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                 [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                 y = y + inc;
            end
            
             decision = 6; 
        
        end

        if rand == 2
              y = 0;
              tx1 = -30;
              tz1 = 0;
              tz2 = 0;
              tz3 = 0; 
              sx = 1;
            while y >= -1.5*pi
                 [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                 [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                 y = y - inc;
            end
            decision = 7;
           
        end
     end
    
     
      if decision == 6
        rand = randi(3,1)
       
        if rand == 1 
            y = -.5*pi;
            tx1 = -30;
            tz1 = 0;
            tz2 = 30;
            tz3 = -30;
            sx= 1;
            while y <= 0
                [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                y = y + inc;
            end
             decision = 5;
             
        end

        if rand == 2
            y = -.5*pi;
            tx1 = 0;
            tz1 = 0;
            tz2 = 30;
            tz3 = -30;
            sx = -1;
            while y <= 0
                     [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                     [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                     y = y + inc;
            end
            
                decision = 8;
        end
        
          if rand == 3
             y   =   1.5*pi;
             tx1 = 0;
             tz1 = -30;
             tz2 = 0;
             tz3 = 0; 
             sx = 1;
            while tz1 <= 0
                     [DP ] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                     [D2T ] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                     tz1 = tz1 + inc2;
            end
            
               decision = 3;
          end 
      end
    
      
       if decision == 7
        rand = randi(3,1)
          
            if rand == 1 
                y   = .5*pi;     
                tx1 = 0;
                tz1 = 0;
                tz2 = 0;
                tz3 = 0;
                sx  = -1;
                while y >= 0
                            [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                            [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                            y = y - inc;
                end

                   decision = 8;
            end

            if rand == 2
                y   = .5*pi;
                tx1 = -30;
                tz1 = 0;
                tz2 = 0;
                tz3 = 0;
                sx  = 1;
                while y >= 0
                         [DP] = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                         [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                         y = y - inc; 
                end
                decision = 5;

            end

            if rand == 3
                 y   = .5*pi;
                 tx1 = -30;
                 tz1 = 0;
                 tz2 = 0;
                 tz3 = 0; 
                 sx  = 1;
                while tz1 >= -30
                         [DP]  = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                         [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                         tz1 = tz1 - inc2;
                end

                decision = 2;

            end 
       end
       
       
       
       if decision == 8
       
           rand = randi(2,1)
       
            if rand == 1 
                y = 0;
                tx1 = 0;
                tz1 = 0;
                tz2 = 0;
                tz3 = 0;
                sx= -1;
                while y >= -1.5*pi
                     [DP]  = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                     [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                     y = y - (inc);   
                end
                decision = 7; 

            end

            if rand == 2
               y = 0;
               tx1 = 0;
               tz1 = 0;
               tz2 = 30;
               tz3 = -30;
               sx = -1;
                while y <= 1.5*pi
                         [DP]  = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans);
                         [D2T] = carGUIFunction(pse,wxmin,wxmax,wymin,wymax,Zall,DP, DP2, DP3, DP4,DP5,DP6,P);
                         y = y + (inc);
                end
                  decision = 6; 
            end
        end
end

pause off
    
    
    
    




