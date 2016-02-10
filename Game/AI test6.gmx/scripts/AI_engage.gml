state = "engaging enemy";
//Move Towards enemy, unless other opportunities arise
if(target_is_valid()){
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
    
  }
}else if(other_targets_available()){
  switch_target();
}else{
  l_pop(cmd_stack);
}
