///NPC create script for multiplayer
if (global.master){
  npcid = npcid_index
  npcid_array[npcid_index] = id
  clearbuffer();
  writebyte(NPC_CREATE);
  writeint(x);
  writeint(y);
  writeint(object_index);
  writeint(npcid_index);
  slave_sendall();
  npcid_index += 1
}
/*else
    {
    npcid = 0
    }
return npcid 


