//create a univeral list of skills
globalvar skill_list;
skill_list = ds_list_create();
var i;
i = 0;

lastcreated = instance_create(0,0,obj_skill_poisonuse);
lastcreated.skl_id = i;
ds_list_add(skill_list,lastcreated);
i+=1;

lastcreated = instance_create(0,0,obj_skill_sneakattack);
lastcreated.skl_id = i;
ds_list_add(skill_list,lastcreated);
i+=1;

lastcreated = instance_create(0,0,obj_skill_mastersneakattack);
lastcreated.skl_id = i;
ds_list_add(skill_list,lastcreated);
i+=1;

lastcreated = instance_create(0,0,obj_skill_criticalstrike);
lastcreated.skl_id = i;
ds_list_add(skill_list,lastcreated);
i+=1;

lastcreated = instance_create(0,0,obj_skill_improvedstealth);
lastcreated.skl_id = i;
ds_list_add(skill_list,lastcreated);
i+=1;
