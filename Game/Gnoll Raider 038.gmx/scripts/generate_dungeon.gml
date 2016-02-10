///Physical Dungeon
var origin,crnt_chamber,stack,temp_num,temp_list,next,prev;

temp_list = ds_list_create();
stack = ds_list_create();

///initialize maze
for(i=0;i<maze_h;i+=1){
    for(j=0;j<maze_w;j+=1){
        lastcreated = instance_create(0,0,obj_abstract_chamber);
        lastcreated.chamber_x = j;
        lastcreated.chamber_y = i;
        lastcreated.list_index = (i*maze_w) + j;
        ds_list_add(chamber_list,lastcreated);
    }
}

origin = floor(random(ds_list_size(chamber_list)));
crnt_chamber = ds_list_find_value(chamber_list,origin);
//crnt_chamber = space_to_chamber(crnt_chamber);//change to chamber
get_adjacent_chambers(stack,crnt_chamber.list_index,maze_w,maze_h);
//get_adjacent_chambers(stack,crnt_chamber);
crnt_chamber.visited = true;
destined_chamber = crnt_chamber;

//do the loop
while(ds_list_size(stack) != 0){
    temp_num = floor(random(ds_list_size(stack))); //get a random chamber from the chamber_list
    crnt_chamber = ds_list_find_value(stack,temp_num); //save the chamber as crnt_chamber
    get_adjacent_chambers(temp_list,crnt_chamber.list_index,maze_w,maze_h); //grab the chambers around it
    //get_adjacent_chambers(stack,crnt_chamber);
    if (!crnt_chamber.visited){ //that place has not been harmed
        get_adjacent_chambers(stack,crnt_chamber.list_index,maze_w,maze_h);//add its neighbors to the list
        //get_adjacent_chambers(stack,crnt_chamber);
        generate_door(crnt_chamber,crnt_chamber.previous);
        //crnt_chamber = space_to_chamber(crnt_chamber);
        crnt_chamber.visited = true;
    }
    ds_list_delete(stack,temp_num);//remove the chamber from the list no matter what
    ds_list_clear(temp_list);
}
ds_list_destroy(stack);
ds_list_destroy(temp_list);

var l;
l = ds_list_size(chamber_list);
for(i=0;i<l;i+=1){
  crnt_chamber = ds_list_find_value(chamber_list,i);
  crnt_chamber.dungeon = id;
  crnt_chamber.tileset = tileset;
    /*
    make extra doors so it circles around a little
    go through each chamber and punch holes as appropriate
    */
}
l = ds_list_size(door_list);
for(i=0;i<l;i+=1){
    crnt_door = ds_list_find_value(door_list,i);
    prev = ds_list_find_value(chamber_list,crnt_door.previous);
    next = ds_list_find_value(chamber_list,crnt_door.next);
    prev.adjacent[crnt_door.dir] = next;//if dir = 0(east), prev[0] = next; next[2] = prev
    next.adjacent[(crnt_door.dir+2)mod(4)] = prev;
}

stair_chamber = destined_chamber;
l = ds_list_size(chamber_list);
if(l>1){
  while(stair_chamber == destined_chamber){
    stair_chamber = ds_list_find_value(chamber_list,floor(random(l)));
  }
  with (stair_chamber){
    is_determined = true;
    script_execute(dungeon.stair_template);
  }
}

