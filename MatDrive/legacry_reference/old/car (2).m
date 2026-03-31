pause on
b =  -30;           % x perspective view
c = 30;            % y perspective view
d = 70;            % z perspective view
x = 0;             % x theta
z = 0;             % z theta 

tx1 = 0;
tx2 = 0;
tx3 = 0;
ty1 = 0;            % y location
ty2 = 0;
ty3 = 0;
tz1 = 0;
tz2 = 0;
tz3 = 0;

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


P  = [1 0 -b/d 0;0 1 -c/d 0 ;0 0 0 0;0 0 -1/d 1]; 

dCar0 = [-6.5 -6.5 -6.5 -6.5 -2.5 -2.5 -.75 -.75 3.25 3.25 4.5 4.5 6.5 6.5 6.5 6.5;
0 0 2.5 2.5 2.5 2.5 4 4 4 4 2.5 2.5 2.5 2.5 0 0;
-2.5 2.5 2.5 -2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 -2.5 2.5 2.5 -2.5;
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
dBuild0 = [-5 5 5 -5 -5 5 5 -5; 0 0 0 0 10 10 10 10; 0 0 10 10 0 0 10 10; 
    1 1 1 1 1 1 1 1];

dB0 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dBuild0;
dB1 = [1 0 0 0; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild0;
dB2 = [1 0 0 -30; 0 1 0 0; 0 0 1 -40; 0 0 0 1] * dBuild0;
dB3 = [1 0 0 -30; 0 1 0 0; 0 0 1 0; 0 0 0 1] * dBuild0;
Trans = [1 0 0 0; 0 1 0 0; 0 0 1 -15; 0 0 0 1] * dCar0; % pushes DP1 off the origan 
dBoard0 = [

 5    6   7     8    9    10   11    12   13    14  15    16  17    18 19     20    20     20   20    20  20    20  20    20  20    20  20    20  20    20  20   20   -40  -41  -42 -43 -44 -45 -46 -47 -48 -49 -50 -50 -50 -50 -50  -50    -50      -50    -50    -50 -50      -50   -50      -50 -50      -50 -50      -50   -50   -50   -50 -50 ;
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


Znew = zeros(64,48);
Znew1 = zeros(8,64);
Znew2 = zeros(16,64);
Z = zeros(8,8);
Zhorz = horzcat(Z,Z); % 8 x 16
Zvert = vertcat(Z,Z); % 16 x 8
Z3 = horzcat(A,Zvert,Zvert,Zvert,Zvert,Znew2);   %32 x 16 1 block of aj  
Z4 = horzcat(Zhorz,B,Z,Z,Z,Znew1);           % 32 x 8 2nd block of aj
Z5 = horzcat(Zhorz,Z,B,Z,Z,Znew1);           % 32 x 8 3rd block of aj
Z6 = horzcat(Zhorz,Z,Z,B,Z,Znew1);         %32 x 8 4th block of aj
Z7 = horzcat(Zhorz,Z,Z,Z,B,Znew1);
Z8 = horzcat(Znew,D);
Zall = vertcat(Z3,Z4,Z5,Z6,Z7,Z8) ;        %entire ajacinty martic



decision = 2

while n < 1

   
    if decision == 1
       
        rand = 1;
    
        if rand == 1 
             y =   0;
             tx1 = 0;
             tz1 = 0;
             tz2 = 30;
             tz3 = -30; 
             sx = 1;
            while y <= .5*pi
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                y = y + (inc);
            end
                decision = 2;
            n = n +1;
        end

        if rand == 2
             y =   0;
             tx1 = 0;
             tz1 = 0;
             tz2 = 0;
             tz3 = 0; 
             sx = 1;
            while y >= -.5*pi
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                y = y - (inc);
                 
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
                               DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                tx1 = tx1 - inc2;
            end
            
                decision = 5;
        end   
    end
    
    
    if decision == 2
        rand = 2
        
        if rand == 1 
             y = .5*pi;
             tx1 = 0;
             tz1 = 0;
             tz2 = 30;
             tz3 = -30;   
             sx = 1;
            while y <= 2*pi 
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
              y = y + (inc);
            end
            n = n + 1
            decision = 1; 
        end

        if rand == 2
            y = .5*pi;
             tx1 = 30;
             tz1 = 0;  
             sx = 1;
            while y >= -2*pi 
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
              y = y - (inc);
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
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
              y = y - (inc);
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
                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
            y = y - (inc);
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
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
              y = y - (inc);
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
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
              y = y + (inc);
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
                                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
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
                               DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                y = y + (inc);
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
                              DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
               y = y - (inc);
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
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
              y = y + (inc);
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
                                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                 y = y + (inc);
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
                               DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
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
            sx= -1;
            while y >= 0
                                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                 y = y - (inc);
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
                               DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                 y = y - (inc); 
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
                                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
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
                             DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
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
                                DP  = carData0( x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans );
                carProject(pse,wxmin,wxmax,wymin,wymax,Zall,DP, dB0,dB1,dB2,dB3,dBoard0,P); 
                y = y + (inc);
            end
              decision = 6; 
        end
        
        end
end

pause off
    
    
    
    




