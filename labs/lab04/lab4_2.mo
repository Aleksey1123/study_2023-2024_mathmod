model lab4_2
parameter Real w = sqrt(4);  
parameter Real g = 8;  

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
der(y) = -w*w*x - g + f(time); 

end lab4_2;