/*
NEXT_ROOM protocol
handles transition between rooms
*/
if (global.master){//Master Receive
  sid = readbyte();
  nextroom_id = readint();
  global.startx = readint();
  global.starty = readint();
  mu_portal[sid] = readint();
  if(nextroom_id >= 0){
  nextroom = room_index[nextroom_id];
  allclear = true; //check if everyone is either on the platform or dead
  for (i=0;i<cjp;i+=1){
      // pchar[i] is alive and if either there is no collision with the portal 
      //or the collision is with a different portal, pchar[i] is not ready
      if (mu_hp[i]>0 && (mu_portal[sid] != mu_portal[i] || mu_portal[sid] < 0)){
        allclear = false;//if a player is not ready, all is not clear
        break;
      }
    }
  }else{
    allclear = false;
  }
  clearbuffer();
  writebyte(NEXT_ROOM);
  writebyte(sid);
  writeint(nextroom_id);
  writeint(global.startx);
  writeint(global.starty);
  writebyte(allclear);
  slave_sendall();
  allclear = false;
}else{//Slave Receive
  sid = readbyte();
  nextroom_id = readint();
  global.startx = readint();
  global.starty = readint();
  allclear = readbyte();
  if (allclear){
    allclear = false;
    roomprevious = room;
    room_id = nextroom_id;
    room_goto(room_index[nextroom_id]);
  }
}
