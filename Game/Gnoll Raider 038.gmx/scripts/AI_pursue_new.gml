state = "pursuing";
if(hunt_timer == 0){
  l_pop(cmd_stack);
  if(other_targets_available()){
    switch_target();
    l_add(cmd_stack,AI_engage);
  }else{
    target_enemy = noone;
  }
}else{
  //chase enemy
  if (has_los(target_enemy)){
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_engage);
    last_heard_x = target_enemy.x;
    last_heard_y = target_enemy.y;
  }else if(alternative_target_is_better()){
    switch_target();
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_engage);
  }else{
    if(sound_heard(target_enemy)){
      close_with_enemy();
      last_heard_x = target_enemy.x;
      last_heard_y = target_enemy.y;
    }else{
      state = "zoning in"
      if(other_targets_available()){
        switch_target();//can't even hear him, so switch targets
        l_pop(cmd_stack);
        l_add(cmd_stack,AI_engage);
      }else{
        state = "confused";
        //keep moving towards the last place you heard him
        mp_potential_step(last_heard_x,last_heard_y,spd,false);
        if(point_distance(last_heard_x,last_heard_y,x,y) < atk_rng){
          //if you're already there, look around
          if((hunt_timer mod 30)==0){
            dir_face += rot_max*floor(random(5));
          }
        }
      }
    }
  }
  hunt_timer -= 1;
}
