///Sprint
if(sprint_btn){
  if (!channeling && sprint_ready && controlling_player == crnt_pnum && !instance_exists(obj_menu_parent)){
    sprint_ready = false;
    spdmod += sprint_mod;
    lastcreated = instance_create(x,y,obj_dummy_sprint);
    lastcreated.target = id;
    lastcreated.speed_increase = sprint_mod;
    lastcreated.alarm[0] = sprint_duration;
    if(sneaking){
      with(obj_dummy_sneak){
        instance_destroy();
      }
    }
  }
}
