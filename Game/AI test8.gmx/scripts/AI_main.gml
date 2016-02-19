var scr;
//general upkeep;
AI_global();

//run top script;
scr = ds_list_find_value(cmd_stack,ds_list_size(cmd_stack)-1);
script_execute(scr);
