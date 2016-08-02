var xpos,ypos,obj;
xpos = argument0;
ypos = argument1;
zpos = argument2;
obj = argument3;

obj = instance_position(xpos,ypos,obj);
//if top edge of object1 at least reaches the bottom of object2
//and the bottom edge of object1 is not higher than the top of object2
//the two must intersect at some point
return (zpos+d >= obj.z && zpos <= obj.z + obj.d);
