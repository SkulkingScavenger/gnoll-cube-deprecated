var ox, oy, dx, dy, orientation;
var trunc_diff, start_diff;
ox = x;
oy = y;
dx = argument0;
dy = argument1;
dir_final = point_direction(ox,oy,dx,dy);
dir_initial = dir_face;
start_diff = degree_difference(dir_initial,dir_final);

//starting difference cannot be greater than 180. 
trunc_diff = 0;
if(start_diff > 90){
  if(degree_difference(dir_final-90,dir_initial)<degree_difference(dir_final+90,dir_initial)){
    dir_initial = dir_final-90;
    trunc_diff = degree_difference(dir_initial,dir_face);
  }else{
    dir_initial = dir_final+90;
    trunc_diff = -1*degree_difference(dir_initial,dir_face);
  }
}
//clockwise if - is faster than +
if(degree_difference(dir_initial-1,dir_final)<degree_difference(dir_initial+1,dir_final)){
  orientation = -1;
}else{
  orientation = 1;
}
localpath = instance_create(0,0,obj_path);
if(start_diff > 30){
  if (!path_local(dx,dy,orientation,trunc_diff)){
    ds_stack_clear(localpath.nodes_x);
    ds_stack_clear(localpath.nodes_y);
    if(start_diff > 90){
      dir_initial += 180;
      trunc_diff = trunc_diff*(-1);
    }
    if(!path_local(dx,dy,orientation*(-1),trunc_diff) || start_diff < 90){
      ds_stack_clear(localpath.nodes_x);
      ds_stack_clear(localpath.nodes_y);
      s_push(localpath.nodes_x,dx);
      s_push(localpath.nodes_y,dy);
      dir_initial = dir_final;
    }
  }
}else{
  ds_stack_clear(localpath.nodes_x);
  ds_stack_clear(localpath.nodes_y);
  s_push(localpath.nodes_x,dx);
  s_push(localpath.nodes_y,dy);
}
//get first node in path
localpath.next_x = s_pop(localpath.nodes_x);
localpath.next_y = s_pop(localpath.nodes_y);
//determine whether to pivot in place
should_pivot = (degree_difference(dir_initial,dir_face)>rot_max);
dir_rot = orientation;
