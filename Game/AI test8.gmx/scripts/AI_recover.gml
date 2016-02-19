state = "recovering from attack";
if(recover_timer == 0){
  atk_ready = false;
  atk_cd_timer = atk_cd;
  l_pop(cmd_stack);
}else{
  recover_timer -= 1;
}
