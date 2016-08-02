var xpos,ypos,output,new_ground;
xpos = argument0;
ypos = argument1;

a = round((ypos+cell_h/2)/cell_h - (xpos+cell_w/2)/cell_w);
b = round((ypos+cell_h/2)/cell_h + (xpos+cell_w/2)/cell_w);
new_ground = instance_position((b - a)/2*cell_w,(b + a)/2*cell_h,obj_terrain_parent);
if(new_ground != noone){
  if (new_ground.sloped){
    output = get_slope_z(xpos,ypos,new_ground);
  }else{
    output = new_ground.z;
  }
}else{
  output = 0;
}
return output;
