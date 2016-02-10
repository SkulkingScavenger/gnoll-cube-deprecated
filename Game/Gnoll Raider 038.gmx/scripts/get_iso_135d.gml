var b,xpos,ypos;
xpos = argument0;
ypos = argument1;
b = (-0.5*xpos) - ypos;
return b;
/*
general formula

theta = argument0
//x = cos(theta);
//y = sin(theta);
//y = bx -> y/x = b
b = sin(theta)/cos(theta);
return b*xpos - ypos;

return sin(theta)/cos(theta);
*/
