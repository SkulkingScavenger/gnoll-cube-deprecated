/*
NEXT_CHAMBER protocol
handles transition between rooms
*/

if (global.master){//Master Receive
  sid = readbyte();
  chamber_id = readint();
  destination_coordinates = readint();
  //some_destination_thing = readint();//what is this?
  mu_destination[sid] = chamber_id;
  allclear = true; //check if everyone is either on the platform or dead
  for (i=0;i<cjp;i+=1){
    // pchar[i] is alive and there is no collision with the portal (collision returns negative value), pchar[i] is not ready
    if (mu_hp[i]>0 && mu_destination[i] == chamber_id){
      allclear = false;//if a player is not ready, all is not clear
      break;
    }
  }
  clearbuffer();
  writebyte(NEXT_CHAMBER);
  writebyte(sid);
  writeint(chamber_id);
  writeint(destination_coordinates);
  writeint(random_get_seed());
  //writeint(some_destination_thing);
  writebyte(allclear);
  slave_sendall();
  if(allclear){
    allclear = false;
    for(i=0;i<cjp;i+=1){
      mu_destination[i] = -1;
    }
    with crnt_dungeon{event_user(0);}
    xpos = crnt_dungeon.destined_chamber.startlocation[destination_coordinates].cell_x;
    ypos = crnt_dungeon.destined_chamber.startlocation[destination_coordinates].cell_y;
    character_spawn(xpos,ypos);
  }
}else{//Slave Receive
  sid = readbyte();
  chamber_id = readint();
  destination_coordinates = readint();
  dungeon_seed = readint();
  random_set_seed(dungeon_seed);
  //some_destination_thing = readint();
  allclear = readbyte();
  if (allclear){
    allclear = false;
    crnt_dungeon.destined_chamber = ds_list_find_value(crnt_dungeon.chamber_list,chamber_id);
    with crnt_dungeon{event_user(0);}
    for(i=0;i<cjp;i+=1){
      var xpos, ypos, w, h;
      w = 32;
      h = 16;
      xpos = crnt_dungeon.destined_chamber.startlocation[destination_coordinates].cell_x;
      ypos = crnt_dungeon.destined_chamber.startlocation[destination_coordinates].cell_y;
      for(i=0;i<cjp;i+=1){
        pchar[i].x = xpos + (i mod 3)*(w) - (i div 3)*(w);
        pchar[i].y = ypos + (i mod 3)*(h) + (i div 3)*(h);
      }
    }
  }
}
