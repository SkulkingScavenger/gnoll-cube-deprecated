//combat
  //determine target (aggro+damage+nearness+relative hp)
  for (i=0;i<cjp;i+=1){
    //
    if (point_distance(x,y,pchar[i].x,pchar[i].y) <= acq_range && (mu_hp[i]>0)){
      //if !collision_line(x,y,pchar[i].x,pchar[i].y,obj_cliffbase_parent,false,true)
      if (!pchar[i].sneaking ){
        //aggro = personal aggro + relative hp + relative nearness + damage dealt
        aggro[i] = (pchar[i].aggro + 100*(1 - (mu_hp[i] div mu_mhp[i])) + 100*(1-(point_distance(x,y,pchar[i].x,pchar[i].y) div acq_range)) + 100*(1-(recent_dmg[i] div (mhp-hitpoints+1))));
        enemy_detected = true;
      }else{
        aggro[i] = 0;
      }
    }else{
      aggro[i] = 0;
    }
  }
  target = noone;
  for (i=0;i<cjp;i+=1){
    if ((aggro[i]>0)&&(target == noone)){
      target = pchar[i];
    }else{
      if (target != noone){
        if (aggro[i]>0) && (aggro[i] > aggro[target.controlling_player]){
          target = pchar[i];
        }
      }
    }
  }
  if (target != noone){
    //if cooldown is up and enemy is in range
        //{attack;}
    if(npc_abl_ready && (point_distance(x,y,target.x,target.y) <= npc_abl_range)){
      behavior = 4;
      channel_timer = npc_abl_dur;  
      action_index = 1;
      image_speed = 0;
    }else if (atk_ready && (point_distance(x,y,target.x,target.y) <= atk_range)){
      behavior = 4;
      channel_timer = atk_dur;  
      action_index = 2;
      image_speed = 0;
    }else{
      mp_potential_step(target.x,target.y,spd,false);//pursue enemy
    }
  }else{
    //lost sight of enemy
    behavior = 0;
  }
  //else 
      //if cooldown is up
          //attack
      //if enemy is moving away
          //chase
      //else
          //if enemy is charging
              //fall back
/*
switch(combat_state){
case "Pursuing":
  /*
  if enemy in LOS or in range, continue pursuit
  else if other enemies available -> charge/attack
  elif -> resume post(alert)/raise alarm/patrol
  */
/*
  break;
case "Attacking":
  break;
case "Charging":
  break;
case "Dodging":
  break;
case "Maintaining Distance/Securing Position":
  /*
  if desired distance reached -> attack
  elif desired distance unattainable -> attack
  elif -> keep retreating
  */
/*
  break;
case "Retreating":
  /*
  if attack feasible -> charge/attack
  elif help available -> raise alarm
  elif out of range/danger past -> become alert
  else keep running
  */
/*
  break;
}
