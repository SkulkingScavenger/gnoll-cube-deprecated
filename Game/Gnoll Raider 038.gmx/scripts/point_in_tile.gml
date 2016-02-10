var xpos,ypos,tile,a,b,output;
xpos = argument0;
ypos = argument1;
tile = argument2;

a = floor(xpos/16)*16; // move to the top of the tile
b = floor(xpos/16)*16 + ((a/16) mod 2)*32; //move to the left edge. possibly shift another 16
target = instance_position(a,b,obj_terrain_parent); //get tile
return (target == tile);

