if(crnt_pnum = controlling_player && interact_btn){
  if (!stunned && !channeling && !instance_exists(obj_menu_parent)){
    if(instance_exists(obj_corpse_parent) && place_meeting(x,y,obj_corpse_parent)){
      channeling = true;//start channeling
      alarm[2] = scavenge_delay;
      lastcreated = instance_create(x,y,obj_dummy_scavenge);
      lastcreated.target = id;
      lastcreated.corpse_obj = instance_nearest(x,y,obj_corpse_parent).object_index;
      lastcreated.alarm[0] = scavenge_delay;
      with(obj_dummy_sneak){//break stealth
        instance_destroy();
      }
      exit;
    }
    if(instance_exists(obj_item_parent) && place_meeting(x,y,obj_item_parent)){///get/push/pull
      target = instance_nearest(x,y,obj_item_parent)
      if (ds_list_size(invlist_index[target.invlistid]) < listmax_index[target.invlistid]){
        if (global.master){
          ds_list_add(invlist_index[target.invlistid],target.itemid);
          with (other){
            instance_destroy();
          }
        }else{
          getting = true;
          clearbuffer();
          writebyte(MU_GET);
          writebyte(crnt_pnum);
          writeint(target.npcid);
          writeint(target.object_index);
          writeint(target.x);
          writeint(target.y);
        }
      }
      //check if there is anything to open, push, pull or otherwise manipulate
      //target = obj_pushable_parent
      //target.pushed = true
      exit;
    }
    if(instance_exists(obj_ally_parent)){//Talk
      var target_npc;
      target_npc = instance_nearest(x,y,obj_ally_parent);
      if (point_distance(x,y,target_npc.x,target_npc.y) <= 96){
        lastcreated = instance_create(view_xview[0],view_yview[0],obj_menu_dialogue);
        lastcreated.target_npc = target_npc;
        lastcreated.participants = ds_list_create();
        ds_list_add(lastcreated.participants,id);
        target_npc.dlg_menu = lastcreated;
        target_npc.conversing = true;
        with (lastcreated){
          lastcreated = instance_create(x+552,y+72,obj_menu_dlg_portrait);
          lastcreated.dlg_menu = id;
          lastcreated.target_npc = target_npc;
          lastcreated.sprite_index = target_npc.portrait;
        }
        with (target_npc){
          event_user(2);
        }
        exit;
      }
    }
    /*
    if(instance_exists(obj_lore_parent)){
      //observation routine
    }
    */
  }
}
