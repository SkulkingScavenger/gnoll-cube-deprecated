//idle
  //wander or stand still
  //check for enemies
  enemy_detected = false;
  for (i=0;i<cjp;i+=1){
    //
    if (point_distance(x,y,pchar[i].x,pchar[i].y) <= acq_range && (mu_hp[i]>0)){
      if (!collision_line(x,y,pchar[i].x,pchar[i].y,obj_pathingblocker_parent,false,true)){
        if (!pchar[i].sneaking || detect_stealth(pchar[i])){
          //aggro = personal aggro + relative hp + relative nearness + damage dealt
          aggro[i] = (pchar[i].aggro + 100*(1 - (mu_hp[i] div mu_mhp[i])) + 100*(1-(point_distance(x,y,pchar[i].x,pchar[i].y) div acq_range)) + 100*(1-(recent_dmg[i] div (mhp-hitpoints+1))));
          enemy_detected = true;
        }else{
          aggro[i] = 0;
        }
      }else{
        aggro[i] = 0;
      }
    }else{
      aggro[i] = 0;
    }
  }
  if (enemy_detected){
    /*
    highest_aggro = 0;
    for (i=0;i<cjp;i+=1){
      if (aggro[i] > highest_aggro){
        highest_aggro = aggro[i];
        target = pchar[i];
      }
    }
    */
    behavior = 1;
  }else{
    //wander,look around,nothing
  }
  break;
