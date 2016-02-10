///PACE
state = "idle - pacing";
//upkeep
if(damaged){
  //take damage
  l_pop(cmd_stack);
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
      l_pop(cmd_stack);
      l_add(cmd_stack,AI_become_suspicious);
      object_of_suspicion = obj;
      suspicion_x = obj.x;
      suspicion_y = obj.y;
      detection_tolerance = 10;
      suspicion_timer = 30;
      exit;
    }
  }
  //if no enemy detected, move in direction of pace target
  var output;
  output = bub_towards_point(patrol_x,patrol_y);
  if(output != 0){
    l_pop(cmd_stack);//end pace
  }
}
