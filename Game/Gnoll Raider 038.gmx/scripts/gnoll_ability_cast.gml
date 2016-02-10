//btn_interact
//btn_cannibalize
//sprint_btn
//sneak_btn
//abl_btn[0-3]
var crnt_abl;

if(!stunned && !channeling && !instance_exists(obj_menu_parent)){
  for(i=0;i<4;i+=1){
    if (abl_btn[i]){
      //replace 2 with cost
      if (abl_slot[i] >= 0){
        crnt_abl = ds_list_find_value(ability_list,abl_slot[i]);
        if (mu_ep[crnt_pnum] >= crnt_abl.base_cost[abl_lvl[abl_slot[i]]] && abl_ready[abl_slot[i]]){    
          //get values from global lists and call the ability
          mu_ep[crnt_pnum] -= crnt_abl.base_cost[abl_lvl[abl_slot[i]]];
          crnt_abl_lvl = abl_lvl[abl_slot[i]];
          event_perform_object(crnt_abl.object_index,ev_other,ev_user1);
        }
      }
    }
  }
}
    
/*
CONDITIONS (client side)
    crnt_pnum = controlling_player
    !instance_exists(obj_menu_parent)
    
    mu_ep[crnt_pnum] >= ep_cost[0]
    abl_cd[0] == 1
    
    stun == false
    channeling == false

EFFECTS (call skill function)
    do main effect
    go on cooldown
    cancel stealth
    subtract ep
