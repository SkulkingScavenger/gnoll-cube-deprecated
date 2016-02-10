var result;
spd_remaining = spd;

while (spd_remaining > 0){
  if (localpath != noone){
    if(should_pivot){
      if (degree_difference(dir_initial,dir_face)>rot_max){
        dir_face += rot_max*dir_rot;
      }else{
        dir_face = dir_initial;
        should_pivot = false;
      }
      break;
    }else{
      result = bub_towards_point(localpath.next_x,localpath.next_y);
      if(result == 1){
        //if target reached
        if (ds_stack_empty(localpath.nodes_x)){
          //if localpath is over
          with(localpath){instance_destroy();}
          localpath = noone;
        }else{
          localpath.next_x = s_pop(localpath.nodes_x);
          localpath.next_y = s_pop(localpath.nodes_y);
        }
      }
    }
  }else{
    if (!ds_list_empty(path.nodes_x)){
      path.next_x = s_pop(path.nodes_x);
      path.next_y = s_pop(path.nodes_y);
      path_local_main(path.next_x,path.next_y);
    }else{
      with(path){instance_destroy();}
      path = noone;
      break;
    }
  }
}
if(!should_pivot){
  dir_move = point_direction(xprevious,yprevious,x,y);
  dir_face = dir_move;
}
