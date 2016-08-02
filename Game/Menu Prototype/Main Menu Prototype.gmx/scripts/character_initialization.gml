pname[crnt_pnum] = charcrt_name;
mu_class[crnt_pnum] = charcrt_class
mu_spr[crnt_pnum] = charcrt_sprite;
mu_icon[crnt_pnum] = charcrt_icon;
mu_lvl[crnt_pnum] = 1;
crnt_atk = charcrt_atk;
crnt_atkspd = charcrt_atkspd;
crnt_rng = charcrt_rng;
crnt_def = charcrt_def;
//crnt_spd = charcrt_spd
crnt_spd = 5;//speed shouldn't be lowered
mu_mhp[crnt_pnum] = charcrt_mhp;
mu_hp[crnt_pnum] = mu_mhp[crnt_pnum];
mu_mep[crnt_pnum] = charcrt_mep;
mu_ep[crnt_pnum] = charcrt_mep;
crnt_wpn = charcrt_weapon;
//mu_armr = charcrt_armor
//mu_armr[crnt_pnum] = 0;//armor currently disabled
gold = 0;
lexp = 0;
//trtpts = 0
sklpts = 0;
//attpts = 0

for(i=0;i<12;i+=1){
  trait[i] = charcrt_trait[i];
}

//Skills are already handled, 
//abilities are already handled,
sneak_level = 1;
scavenge_level = 1;
sprint_level = 1;

derive_load_variables();

save_game(pname[crnt_pnum]);


