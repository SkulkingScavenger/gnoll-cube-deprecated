state = "attacking";
if(atk_timer == 0){
  //execute attack
  l_pop(cmd_stack);
  l_add(cmd_stack,AI_recover);
  recover_timer = recover_dur;
}else{
  atk_timer -= 1;
}
