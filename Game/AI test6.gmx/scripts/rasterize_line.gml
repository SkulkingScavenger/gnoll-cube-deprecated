var dx,dy,x1,y1,x2,y2,xpos,ypos,D,swap,s1,s2;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
xpos = x1; ypos = y1;
dx = abs(x2 - x1); dy = abs(y2 - y1);
s1 = sign(x2 - x1); s2 = sign(y2 - y1);
swap = 0;
if (dy > dx) {temp = dx; dx = dy; dy = temp; swap = 1;}
//plot(x0,y0)
D = 2*dy - dx;
for (i = 0; i < dx; i+=1) {
draw_sprite(pixel,0,xpos,ypos);
while (D >= 0)
{ D = D - 2*dx; if (swap) xpos += s1; else ypos += s2; }
D = D + 2*dy; if (swap) ypos += s2; else xpos += s1;
}
