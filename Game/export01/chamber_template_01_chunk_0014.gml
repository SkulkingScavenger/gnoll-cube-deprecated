x_offset = argument0;y_offset = argument1;
if (adjacent[0] != noone){
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1312;
lastcreated.cell_y = 144;
lastcreated.cell_type = obj_door;
lastcreated.entrance_id = 0;
entrance[0] = lastcreated;
ds_list_add(cell_list,lastcreated);lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1248+ x_offset;
lastcreated.cell_y = 144+ y_offset;
lastcreated.cell_z = 0;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
startlocation[0] = lastcreated;
}else{
  
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1312+ x_offset;
lastcreated.cell_y = 144+ y_offset;
lastcreated.cell_z = 64;
lastcreated.cell_type = obj_door_empty;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
lastcreated.entrance_id = 0;
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1344+ x_offset;
lastcreated.cell_y = 160+ y_offset;
lastcreated.cell_z = 64;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
}

if (adjacent[1] != noone){
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 832;
lastcreated.cell_y = 224;
lastcreated.cell_type = obj_door;
lastcreated.entrance_id = 1;
entrance[1] = lastcreated;
ds_list_add(cell_list,lastcreated);lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 832+ x_offset;
lastcreated.cell_y = 256+ y_offset;
lastcreated.cell_z = 0;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
startlocation[1] = lastcreated;
}else{
  
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 832+ x_offset;
lastcreated.cell_y = 224+ y_offset;
lastcreated.cell_z = 64;
lastcreated.cell_type = obj_door_empty;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
lastcreated.entrance_id = 1;
}

if (adjacent[2] != noone){
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 128;
lastcreated.cell_y = 992;
lastcreated.cell_type = obj_door;
lastcreated.entrance_id = 2;
entrance[2] = lastcreated;
ds_list_add(cell_list,lastcreated);lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 192+ x_offset;
lastcreated.cell_y = 992+ y_offset;
lastcreated.cell_z = 64;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
startlocation[2] = lastcreated;
}else{
  
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 128+ x_offset;
lastcreated.cell_y = 992+ y_offset;
lastcreated.cell_z = 128;
lastcreated.cell_type = obj_door_empty;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
lastcreated.entrance_id = 2;
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 96+ x_offset;
lastcreated.cell_y = 1008+ y_offset;
lastcreated.cell_z = 128;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
}

if (adjacent[3] != noone){
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1280;
lastcreated.cell_y = 1024;
lastcreated.cell_type = obj_door;
lastcreated.entrance_id = 3;
entrance[3] = lastcreated;
ds_list_add(cell_list,lastcreated);lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1280+ x_offset;
lastcreated.cell_y = 928+ y_offset;
lastcreated.cell_z = 0;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
startlocation[3] = lastcreated;
}else{
  
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 1280+ x_offset;
lastcreated.cell_y = 1024+ y_offset;
lastcreated.cell_z = 64;
lastcreated.cell_type = obj_door_empty;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
lastcreated.entrance_id = 3;
}
lastcreated = instance_create(0,0,obj_abstract_cell);
lastcreated.cell_x = 320+ x_offset;
lastcreated.cell_y = 256+ y_offset;
lastcreated.cell_z = 0;
lastcreated.cell_type = obj_ground;
lastcreated.chamber = id;
ds_list_add(cell_list,lastcreated);
startlocation_main = lastcreated;
