state = "entering combat";

if(battlecry_timer == 0){
  surprised = false;
  l_pop(cmd_stack);
  l_add(cmd_stack,AI_engage); 
}else{
  battlecry_timer -= 1;
}
