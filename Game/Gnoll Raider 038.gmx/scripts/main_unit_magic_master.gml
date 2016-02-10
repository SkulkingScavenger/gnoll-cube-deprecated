sid = readbyte();
crnt_abl = readbyte();
if (crnt_abl == 51){
  corpse_obj = readint();
  mu_sklpwr = readint();
  mu_spec = readbyte();
  target = pchar[sid]
  if (instance_exists(corpse_obj)){
    corpsetarget = instance_nearest(target.x,target.y,corpse_obj);
    if (point_distance(target.x,target.y,corpsetarget.x,corpsetarget.y) <= 32){
      mu_ep[sid] += mu_sklpwr;
      if (mu_ep[sid] > mu_mep[sid]){
        mu_ep[sid]=mu_mep[sid];
      }
      if (mu_spec){
        mu_hp[sid] += mu_sklpwr;
        if (mu_hp[sid] > mu_mhp[sid]){
          mu_hp[sid]=mu_mhp[sid];
        }
      }
      clearbuffer();
      writebyte(MU_MAG);
      writebyte(sid);
      writebyte(51);
      writeint(corpse_obj);
      writeint(mu_sklpwr);
      writebyte(mu_spec);
      writeint((instance_nearest(target.x,target.y,corpse_obj)).npcid);
      slave_sendall();
      with (corpsetarget){
        instance_destroy();
      }
    }
  }
}else{
  event_perform_object(crnt_abl.object_index,ev_other,ev_user2);
}

