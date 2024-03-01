model lab4_3
parameter Real w = sqrt(4);  
parameter Real g = 8;  

parameter Real x0 = 0; 
parameter Real y0 = -2; 

Real x(start=x0); 
Real y(start=y0); 

function f 
input Real t ; 
output Real res; 
algorithm  
res := 5 * sin(2 * t);
end f;  

equation 
der(x) = y; 
der(y) = -w*w*x - g*y - f(time); 

end lab4_3;