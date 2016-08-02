//declare inventory variables
globalvar inv_list,inv_max,inv_stacks;

inv_list[0] = ds_list_create();//treasure
inv_list[1] = ds_list_create();//useable
inv_list[2] = ds_list_create();//weapons
inv_list[3] = ds_list_create();//armor
inv_list[4] = ds_list_create();//special
inv_list[5] = ds_list_create();//key items

//treasure and useable items are stackable
inv_stacks[0] = ds_list_create();
inv_stacks[1] = ds_list_create();

inv_max[0] = 31;
inv_max[1] = 31;
inv_max[2] = 4;
inv_max[3] = 2;
inv_max[4] = 31;
inv_max[5] = 15;
