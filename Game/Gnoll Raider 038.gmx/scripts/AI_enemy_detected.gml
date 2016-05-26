var obj;
obj = argument0;
if (target_in_range(obj,max(vision_radius,hearing_radius,scent_radius))){//If its even worth trying
  if(scent_smelled(obj)){
    detection_type = "scent";
    return true;
  }else if(sound_heard(obj)){
    detection_type = "hearing";
    return true;
  }else if(glimpse_caught(obj)){
    detection_type = "peripheral_vision";
    return true;
  }
}
return false;
