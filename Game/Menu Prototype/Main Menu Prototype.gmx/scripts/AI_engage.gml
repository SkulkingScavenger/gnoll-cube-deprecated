state = "engaging enemy";
//Move Towards enemy, unless other opportunities arise
if(target_is_valid(target_enemy)){
  if(has_los(target_enemy)){
    if(target_in_range(target_enemy,atk_rng)){
      if(atk_ready){
        atk_timer = atk_dur;
        ds_list_add(cmd_stack,AI_attack);
      }else{
        strafe();
      }
    }else{
      close_with_enemy();
      if(target_in_range(target_enemy,atk_rng)){
        if(atk_ready){
          atk_timer = atk_dur;
          ds_list_add(cmd_stack,AI_attack);
        }
      }
    }
  }else if(alternative_target_is_better()){
    switch_target();
  }else{
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_pursue);
    hunt_timer = hunt_duration;
    last_heard_x = target_enemy.x;
    last_heard_y = target_enemy.y;
  }
}else if(other_targets_available()){
  switch_target();
}else{
  l_pop(cmd_stack);
}
