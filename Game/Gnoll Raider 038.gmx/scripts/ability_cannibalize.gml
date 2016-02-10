//argument0 is optional
if instance_exists(target) && instance_exists(obj_corpse_parent)
    {
    if point_distance(target.x,target.y,instance_nearest(target.x,target.y,obj_corpse_parent).x,instance_nearest(target.x,target.y,obj_corpse_parent).y) <= 32
        {
        if (argument0 >= 0){
          targetcorpse = argument0;
        }else{
          targetcorpse = instance_nearest(target.x,target.y,obj_corpse_parent);
        }
        if (global.master){
          with (targetcorpse){
            instance_destroy();
          }
        }
        //restore energy
        mu_ep[crnt_pnum] += can_str;
        if (mu_ep[crnt_pnum] > mu_mep[crnt_pnum]){
          mu_ep[crnt_pnum] = mu_mep[crnt_pnum];
        }
        //if hp_regen enabled, regenerate hp too
        if (can_hpreg){
          mu_hp[crnt_pnum] += can_str;
          if (mu_hp[crnt_pnum] > mu_mhp[crnt_pnum]){
            mu_hp[crnt_pnum] = mu_mhp[crnt_pnum];
          }
        }
      }
    else
        {
        lastcreated = instance_create(target.x,target.y,obj_fltext);
        lastcreated.text = "There arent any good corpses nearby";
        lastcreated.alarm[0] = 30;
        lastcreated.target = pchar[crnt_pnum];
        }
    }
