if(global.multiplayer){
  if(global.master){
    with (obj_mlobbycontrol){instance_destroy();}
  }else{
    with (obj_slobbycontrol){instance_destroy();}
  }
}
//instance_create(0,0,obj_control);
//crnt_dungeon = instance_create(0,0,obj_dungeon_yahazeer);
//room_goto(room_lair01);
