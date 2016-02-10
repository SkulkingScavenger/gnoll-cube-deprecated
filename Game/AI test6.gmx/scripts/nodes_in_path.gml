var dx,dy,x1,y1,x2,y2,w,obj,xpos,ypos,D,swap,s1,s2,output,i,target;
x1 = argument0;
y1 = argument1-1;
x2 = argument2;
y2 = argument3-1;
w = argument4;
output = ds_map_create();
xpos = x1; ypos = y1;
dx = abs(x2 - x1); dy = abs(y2 - y1);
s1 = sign(x2 - x1); s2 = sign(y2 - y1);
swap = 0;
if (dy > dx) {temp = dx; dx = dy; dy = temp; swap = 1;}
//plot(x0,y0)
D = 2*dy - dx;
for (i = 0; i < dx; i+=1) {
//top
target = instance_position(xpos+cell_w/2*w,ypos,obj_terrain_parent);
if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
//bottom
target = instance_position(xpos+cell_w/2*w,ypos+cell_h*w,obj_terrain_parent);
if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
//left
target = instance_position(xpos,ypos+cell_h*w/2*w,obj_terrain_parent);
if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
//right
target = instance_position(xpos+cell_w*w,ypos+cell_h/2*w,obj_terrain_parent);
if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
while (D >= 0)
{D = D - 2*dx; if (swap) xpos += s1; else ypos += s2;}
D = D + 2*dy; if (swap) ypos += s2; else xpos += s1;
}
return output
