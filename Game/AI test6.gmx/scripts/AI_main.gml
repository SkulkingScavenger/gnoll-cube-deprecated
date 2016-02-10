var scr;
//general upkeep;
if(!atk_ready){//attak cooldown
  atk_timer -= 1;
  if (atk_timer == 0){
    atk_ready = true;
  }
}
//run top script;
scr = ds_list_find_value(cmd_stack,ds_list_size(cmd_stack)-1);
script_execute(scr);
