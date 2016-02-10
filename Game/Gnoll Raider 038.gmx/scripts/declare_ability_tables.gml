globalvar ability_list;

//create the global_list
ability_list = ds_list_create();
//create abilities and add them to the list
i=0;
//Poison Use ability
lastcreated = instance_create(0,0,obj_abl_applypoison);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Crippling Strike ability
lastcreated = instance_create(0,0,obj_abl_cripplingstrike);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Reflexes Ability
lastcreated = instance_create(0,0,obj_abl_reflexes);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Shadow Meld Ability
lastcreated = instance_create(0,0,obj_abl_shadowmeld);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Lay Trap Ability
lastcreated = instance_create(0,0,obj_abl_settrap);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//First Aid Ability
lastcreated = instance_create(0,0,obj_abl_firstaid);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Surgery Ability
lastcreated = instance_create(0,0,obj_abl_surgery);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Life Support Ability
lastcreated = instance_create(0,0,obj_abl_lifesupport);
lastcreated.abl_index = i;
ds_list_add(ability_list,lastcreated);
i+=1;

//Set Initial Values for global ability variables
var l;
l = i+1;
for(i=0;i<l;i+=1){
  abl_ready[i] = true;
  abl_lvl[i] = -1;
}
