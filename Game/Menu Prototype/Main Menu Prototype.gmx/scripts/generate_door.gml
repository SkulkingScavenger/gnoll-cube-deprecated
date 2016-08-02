//argument0 = current chamber
//argument1 = previous chamber

var prev,dir,lastcreated;
prev = ds_list_find_value(chamber_list,argument1);

if (argument0.chamber_x < prev.chamber_x){
    dir = 2;
}else if (argument0.chamber_x > prev.chamber_x){
    dir = 0;
}else if (argument0.chamber_y < prev.chamber_y){
    dir = 1;
}else if(argument0.chamber_y > prev.chamber_y){
    dir = 3;
}

lastcreated = instance_create(0,0,obj_abstract_door);
lastcreated.previous = prev.list_index;
lastcreated.next = argument0.list_index;
lastcreated.dir = dir;
lastcreated.dungeon = id;
ds_list_add(door_list,lastcreated);
