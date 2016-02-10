///NPC death handler
if (global.master){
  npcid_array[npcid] = -1 //set slot to null
  clearbuffer();
  writebyte(NPC_DEAD);
  writeint(npcid);  
  /*
  writeint(x);
  writeint(y);
  writeint(corpse);
  writeint(baseexp);
  writeint(rewardnum);
  for(i=0;i < rewardnum;i+=1){
    writeint(rewardtype[i]);
    writeint(rewardindex[i]);
  }
  */
  slave_sendall();

  //Drop Rewards
  for(i=0;i < rewardnum;i+=1){
    switch(rewardtype[i]){
      case 0:
        instance_create(x+4*i,y,treasureind[rewardindex[i]]);
        break;
      case 1:
        instance_create(x+4*i,y,usableind[rewardindex[i]]);
        break;
      case 2:
        instance_create(x+4*i,y,questind[rewardindex[i]]);
        break;
      case 3:
        instance_create(x+4*i,y,wpnitemind[rewardindex[i]]);
        break;
      case 5:
        instance_create(x+4*i,y,coinind[rewardindex[i]]);
    }
  }
  if (corpse > 0){
    instance_create(x,y,corpseind[corpse])
  }
  instance_destroy();//destroy the instance
  /*
  if (baseexp > 0){
    lexp += (baseexp div cjp)
  } 
  */           
}else{//Slave Receive
  crnt_npcid = readint();
  /*
  rewardx = readint();
  rewardy = readint();
  corpse = readint();
  exp_award = readint();
  rewardnum = readint();
  */
  with (npcid_array[crnt_npcid]){
    instance_destroy();
  }
  npcid_array[crnt_npcid] = -1;
  /*
  for(i=0;i < rewardnum;i+=1){
    reward_type = readint();
    reward_index = readint();
    switch (reward_type){
      case 0:
        instance_create(x+4*i,y,treasureind[reward_index]);
        break;
      case 1:
        instance_create(x+4*i,y,usableind[reward_index]);
        break;
      case 2:
        instance_create(x+4*i,y,questind[reward_index]);
        break;
      case 3:
        instance_create(x+4*i,y,wpnitemind[reward_index]);
        break;
      case 5:
        instance_create(x+4*i,y,coinind[reward_index]);
        break;
    }
  }
  */
}

