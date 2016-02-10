///Stealth
if(sneak_btn){
  if (!stunned && !channeling && !snared && sneak_ready && controlling_player == crnt_pnum && !instance_exists(obj_menu_parent)){
    sneak_ready = false;
    alarm[2] = sneak_delay;//channel
    channeling = true;
    lastcreated = instance_create(x,y,obj_dummy_sneak);
    lastcreated.target = id;
    lastcreated.alarm[0] = sneak_delay;
  }
}
