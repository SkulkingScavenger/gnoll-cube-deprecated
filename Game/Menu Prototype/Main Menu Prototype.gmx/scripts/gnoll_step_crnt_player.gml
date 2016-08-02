if(crnt_dungeon != noone){
  if(crnt_dungeon.entering || crnt_dungeon.exiting){
    image_speed = 0;
    exit;
  }
}
//PHASE I: Maintenance


//PHASE II: Movement

//Use Abilities
gnoll_ability_cast();
gnoll_interact();

//Jump
gnoll_jump();
//Acceleration Due to Gravity
if(z > 0){
  zspd -= 2;
}
if (z+zspd <= 0){
  z = 0;
  zspd = 0;
}else{
  z += zspd;
}

gnoll_sneak();
gnoll_sprint();
gnoll_move();

gnoll_attack();



//PHASE III: Set Animation
if(xspd == 0 && yspd == 0){
  image_speed = 0;
}else{
  image_speed = 0.5;
}
set_image(mu_spr[controlling_player],mfdir[controlling_player]);

//PHASE IV: Multiplayer
mu_move();
