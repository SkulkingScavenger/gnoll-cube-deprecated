#define hammer_of_cosine
var a,b,c;
a = argument0;
b = argument1;
c = argument2;
return darccos((a*a + b*b - c*c)/(2*a*b));

#define degree_difference
var a,b;
a = argument0 mod 360;
b = argument1 mod 360;
return 180 - abs(abs(a - b) - 180);

