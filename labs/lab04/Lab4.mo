model Lab4
  //case1: x''+ 4.3x = 0

model lab4_1
parameter Real w = sqrt(4);  
parameter Real g =0;  

parameter Real x0 = 0; 
parameter Real y0 = -2; 

Real x(start=x0); 
Real y(start=y0); 
// f(t)
function f 
input Real t ; 
output Real res; 
algorithm  
res := 0; 
end f; 

equation 
der(x) = y; 
der(y) = -w*w*x - g*y + f(time); 
end lab4_1;
  
  equation

annotation ( 
      experiment( 
        StopTime = 100  // Промежуток времени моделирования от 0 до 100 
      ) 
  );
    
end Lab4;