state = "idle - high alert";
var obj;
enemies[0] = obj_guy;
enemies[1] = noone;
enemies[2] = noone;
s = 1;
dir_face = rotate_towards_direction(rot_max,dir_face,point_direction(x,y,suspicion_x,suspicion_y));
for(i=0;i<s;i+=1){
  obj = enemies[i];//need to replace this with something more sophisticated later
  if (target_clearly_visible(obj) || detection_tolerance <= 0){
    l_add(enemy_list,obj);
    lastcreated = instance_create(0,0,obj_data);
    lastcreated.target = obj;
    lastcreated.out_of_sight_count = 0;
    l_add(enemy_data,lastcreated);
  }else{
    //turn towards source of disturbance 
    if (AI_enemy_detected(obj)){//check again;
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
if(!ds_list_empty(enemy_list)){
    target_enemy = obj;
    battlecry_timer = battlecry_dur;
    dir_move = dir_face;
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_enter_combat);
    exit;
}else if(suspicion_timer <= 0){
  l_pop(cmd_stack);//I guess it was nothing
}else{
  suspicion_timer -= 1;//nothings moving. just watch the spot for a while...
}
