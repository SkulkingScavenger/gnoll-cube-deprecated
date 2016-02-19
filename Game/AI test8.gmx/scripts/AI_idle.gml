///Idle
state = "idle - standby";
//upkeep

//make decision
if(damaged){
  //take damage
  surprised = true;
  battlecry_timer = battlecry_dur;
  ds_list_add(cmd_stack,AI_enter_combat);
  ds_list_add(cmd_stack,AI_knockback);
}else{
  enemies[0] = obj_guy;
  s = 1;
  for(i=0;i<s;i+=1){
    obj = enemies[i];//need to replace this with something more sophisticated later
    if(enemy_detected(obj)){
      //become suspicious
      l_add(cmd_stack,AI_become_suspicious);
      object_of_suspicion = obj;
      suspicion_x = obj.x;
      suspicion_y = obj.y;
      detection_tolerance = suspicion_threshold;
      suspicion_timer = suspicion_duration;
      exit;
    }
  }
  if(random(15)<1){
    origin_x = x;
    origin_y = y;
    if(returning){
      patrol_x = x+128;
      patrol_y = y+128;
    }else{
      patrol_x = x-128;
      patrol_y = y-128;
    }
    returning = !returning;
    ds_list_add(cmd_stack,AI_pace);
  }
}


