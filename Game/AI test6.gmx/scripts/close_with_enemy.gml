///Close With Enemy
var s,node,path_reusable,point_dir,path_possible;
point_dir = point_direction(x,y,target_enemy.x,target_enemy.y);
if(line_pathable(x,y,target_enemy.x,target_enemy.y,ceil(w/cell_w)) && degree_difference(dir_face,point_dir) < rot_max*2){
  spd_remaining = spd;
  bub_towards_point(target_enemy.x,target_enemy.y);
  dir_move = point_direction(xprevious,yprevious,x,y);
  dir_face = dir_move;
}else{
  path_possible = true;
  if(target_enemy.x >= 0 && target_enemy.x <= room_width && point_distance(x,y,target_enemy.x,target_enemy.y)>atk_rng){
    if(path != noone){
      if(target_enemy.x != target_enemy.xprevious || target_enemy.y != target_enemy.yprevious && path_counter > 3){
        if (!path_is_reusable(target_enemy)){
          path_possible = path_main(target_enemy.x,target_enemy.y);
          path_counter = 0;
        }
      }
    }else{
      path_possible = path_main(target_enemy.x,target_enemy.y);
      path_counter = 0;
    }
    if(path_possible){
      local_movement();
      path_counter += 1;
    }else{
      //path not possible
      show_message("path not possible!");
      with(path){instance_destroy();}
      path = noone;
      with(localpath){instance_destroy();}
      localpath = noone;
    }
  }else{
    if(point_distance(x,y,target_enemy.x,target_enemy.y)<=atk_rng){
      with (localpath){instance_destroy();}
      localpath = noone;
      with (path){instance_destroy();}
      path = noone;
    }
  }
}
