///Maintenance

//attack cooldown
if(atk_cd_timer > 0){
  atk_cd_timer -= 1;
  if(atk_cd_timer == 0){
    atk_ready = true;
  }
}
