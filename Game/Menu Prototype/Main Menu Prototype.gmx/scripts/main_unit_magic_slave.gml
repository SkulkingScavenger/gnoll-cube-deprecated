sid = readbyte();
crnt_abl_id = readbyte();
if (crnt_abl_id == 51){
  corpse_obj = readint();
  mu_sklpwr = readint();
  mu_spec = readbyte();
  mu_ep[sid] += mu_sklpwr;
  if (mu_ep[sid] > mu_mep[sid]){mu_ep[sid]=mu_mep[sid];}
  if (mu_spec){
    mu_hp[sid] += mu_sklpwr;
    if (mu_hp[sid] > mu_mhp[sid]){
      mu_hp[sid]=mu_mhp[sid];
    }
  }
}else{
  crnt_abl = ds_list_find_value(ability_list,crnt_abl_id);
  event_perform_object(crnt_abl.object_index,ev_other,ev_user3);
}
