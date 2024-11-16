 if function1 == 1
                 
        if row == .5
            tz1 = 0;
        end
        if row == -.5
            tz1 = -30;
        end
        if row == 1.5
            tz1 = 30;
        end
        
        
        y = 0;            
        var = 0;
        tx2 = 0;
        tx3 = 0;
%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
        sx = 1;
        
           
        while var <= 30             % no matter where car is increment 
            
                if tx1 <= -45
                    tx1 = 50;
                end

                tx1 = tx1 - inc2;

  

                var = var + inc2;
        end
    end
    
    
    if function1 == 2
         
        
        y = 0;            
        var = 0;
        tx2 = 0;
        tx3 = 0;
%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
        sx = -1;
        
           
        while var <= 30             % no matter where car is increment 
            
                if tx1 <= -45 
                    tx1 = 50;
                end

                tx1 = tx1 - inc2;

                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    

                var = var + inc2;
        end
    end
    
    
    if function1 == 3 % && face == pi/2                
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
               y = pi/2;            
        var = 0;
        tx2 = 0;
        tx3 = 0;
%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
        sx = 1;
        
           
        while var <= 30             % no matter where car is increment 
            
                if tz1 <= -45 
                    tz1 = 50;
                end

                tz1 = tz1 - inc2;

                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    

                var = var + inc2;
        end
    end
    
    
    
    
    if function1 == 4 % && face == pi/2
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
               y = pi/2;            
        var = 0;
        tx2 = 0;
        tx3 = 0;
%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
        sx = -1;
        
           
        while var <= 30             % no matter where car is increment 
            
                if tz1 <= -45 
                    tz1 = 50;
                end

                tz1 = tz1 - inc2;

                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    

                var = var + inc2;
        end
    end
    
    
    
    if function1 == 5
        
               
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end

        y = pi/2;
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = -1;
        
        while y >= pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                y = y - (inc);
               
         end
    end
    
    
    if function1 == 6
        
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
        y = pi/2;
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = 1;
        
        while y >= 0
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall); 
                y = y - (inc);
               
         end
    end
    
    
    if function1 == 7
        
        
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        y = pi;
        
                    
               
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = -1;
        
        while y >= pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);    
                y = y - (inc);
               
         end
    end
    
    
    if function1 == 8
        
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
        
        y = 0;
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = 1;
        
        while y >= -pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);  
                y = y - (inc);
               
         end
    end
    
    
    if function1 == 9
        
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
                  
        y = 3*pi/2;
        
                    
               
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = -1;
        
        while y >= pi
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);   
                y = y - (inc);
               
         end
    end
    
    
    if function1 == 10
                  
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
        y = -pi/2;
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = 1;
        
        while y >= -pi
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);   
                y = y - (inc);
               
         end
    end
    
    
    if function1 == 11      
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
        y = 0;
        
                    
               
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = -1;
        
        while y >= -pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);   
                y = y - (inc);
               
         end
    end
    
    
    
    if function1 == 12
        
                
        if row == 0
            tz1 = 0;
        end
        if row == 1
            tz1 = -30;
        end
        if row == -1
            tz1 = 30;
        end
        
        if col == 0
            tx1 = 0;
        end
        if col == 1
            tx1 = -30;
        end
        if col == -1
            tx1 = 30;
        end
        
        
        y = -pi;
        tx2 = 0;
        tx3 = 0;

%         tz1 = 0;
        tz2 = 0;
        tz3 = 0;
    
        sx = 1;
        
        while y >= -3*pi/2
                DP = carFunction1(x,y,z,tx1,ty1,tz1,tx2,ty2,tz2,tx3,ty3,tz3,sx,sy,sz,Trans); 
                
                carFunction2(b,c,d,pse,wxmin,wxmax,wymin,wymax,DP,DP0,DP1,DP2,DP3,DP4,DP5,DP6,DP7,DP8,Zall);  
                y = y - (inc);
               
         end
    end