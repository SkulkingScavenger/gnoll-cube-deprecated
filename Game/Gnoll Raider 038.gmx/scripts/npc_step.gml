if (global.master){
  if(hitpoints > 0){
    clearbuffer();
    writebyte(NPC_STEP);
    writeint(npcid);
    writeint(x);
    writeint(y);
    writeint(xspd);
    writeint(yspd);
    writeint(hitpoints);
    writeint(behavior);    
    slave_sendall();
  }else{
    npc_dead();
  }
}

