var obj,range,output;
obj = argument0;
range = argument1;
output = (point_distance(x+w/2,y+h/2,obj.x+obj.w/2,obj.y+obj.h/2)) <= range;
return output;
