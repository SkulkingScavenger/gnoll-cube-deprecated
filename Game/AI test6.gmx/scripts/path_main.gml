var xpos,ypos;
xpos = argument0;
ypos = argument1;
initial_x = xpos;
initial_y = ypos;

if (path != noone){
  with(path){instance_destroy();}
}
path = theta_star(xpos,ypos,max_path_dist);
//post process?
if (path != noone){
  return true;
}else{
  return false;
}
