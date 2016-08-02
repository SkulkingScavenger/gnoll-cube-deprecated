///Attack & send MU_ATK
if(crnt_pnum = controlling_player && attack_btn){
  if (atk_ready && !stunned && !channeling && !instance_exists(obj_menu_parent)){
    ///Attack
    lastcreated = instance_create(x,y,wpnobj[crnt_wpn]);
    projectile_start_position(lastcreated,dir_face);
    lastcreated.z = z;
    lastcreated.base_z = base_z;
    lastcreated.controlling_player = crnt_pnum;
    lastcreated.dir = dir_face;
    with(lastcreated){event_user(0);}
    lastcreated.alarm[0] = (((crnt_rng + rngmod)*16)div lastcreated.spd);
    lastcreated.dmg = crnt_atk + atkmod;
    if(sneaking){
      with(obj_dummy_sneak){
        instance_destroy();
      }
    }
    
  
    //set poison if applicable
    if (poison_dmg > 0){
      lastcreated.poison_dmg = poison_dmg;
      lastcreated.poison_duration = poison_duration;
    }
    if (snare_duration > 0){
      lastcreated.snare_duration = snare_duration;
    }
    /*
    for(i=0;i<debuff_count;i+=1){
      lastcreated.debuff[i] = 0; //0=spd, 1=dmg, 2=def, 3=silence
      lastcreated.debuff_duration[i] = 0;
      lastcreated.debuff_str[i] = 0;
    }
    */
    
    
    with (lastcreated){
      event_perform(ev_other,ev_user0);
    }
  
    //cooldown
    atk_ready = false;
    alarm[0] = (60 div crnt_atkspd);
    
  
    //send MU_ATK
    clearbuffer();
    writebyte(MU_ATK);
    writebyte(crnt_pnum);
    writeint(wpnobj[crnt_wpn]);
        //writeint(atkstat)
    writeint(x);
    writeint(y);
        //writeint(projectilespd)
    writeint(dir_face);
    writeint(crnt_rng+rngmod);
    writeint(crnt_atk+atkmod);
    if (global.master){
      slave_sendall();
    }
    else{
      sendmessage(server);
    }
  }
}
