///create generic objects for all rooms
if (global.master){
  instance_create(x+16,y,obj_mastercontrol);
}else{
  with(obj_npc_parent){
    //IN TESTING
    id_found = false;
    for(i=1;i<npcid_index;i+=1){
      if (npcid_array[i] == id){
        id_found = true;
        break;
      }
    }
    if (!id_found){
      instance_destroy();
    }
    //IN TESTING
    //instance_destroy()
  }
  instance_create(x+16,y,obj_slavecontrol);
}


