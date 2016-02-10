state = "idle - high alert";
var obj;
enemies[0] = obj_guy;
s = 1;
for(i=0;i<s;i+=1){
  obj = enemies[i];//need to replace this with something more sophisticated later
  if (target_clearly_visible(obj) || detection_tolerance <= 0){
    target_enemy = obj;
    battlecry_timer = battlecry_dur;
    dir_move = dir_face;
    l_add(cmd_stack,AI_enter_combat);
    exit;
  }else{
    //turn towards source of disturbance 
    if (enemy_detected(obj)){//check again;
      switch (detection_type){
      case("scent"):
        //you can smell him. you know he's there. so hunt him down "go go go!" "arf! arf! arf!"
        l_add(cmd_stack,AI_aggressive_investigate);
        break;
      case("hearing"):
        if (obj.x != obj.xprevious || obj.y != obj.yprevious || (obj.z == obj.base_z && obj.zprevious != obj.base_z)){
          //I thought I heard something!
          detection_tolerance -= 1;
          suspicion_timer += 10;
          break;
        }
      case("sight"):
        if (obj.x != obj.xprevious || obj.y != obj.yprevious || obj.z != obj.zprevious){
          //whats that over there?
          detection_tolerance -= 1;
          suspicion_timer += 10;
          break;
        }
      }
    }
  }
}
//nothings moving. just watch the spot for a while
if(suspicion_timer <= 0){
  l_pop(cmd_stack);//I guess it was nothing
}else{
  suspicion_timer -= 1;
}
