var xpos,ypos,zpos,obj,diff,output,z_new;
xpos = argument0;
ypos = argument1;
zpos = argument2;
obj = argument3;
diff = argument4;
output = false;

if (obj.sloped){//if target is a ramp
  // find out the zpos of the ramp at the target position
  z_new = get_slope_z(xpos,ypos,obj);
  debug = z_new;
  if (abs(z_new - zpos) < diff){//if the unit would not be in an illegal position by moving to this point
    output = true;
  }
}

return output;
