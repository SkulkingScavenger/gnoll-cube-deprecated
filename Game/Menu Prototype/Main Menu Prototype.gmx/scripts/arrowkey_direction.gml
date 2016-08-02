//takes no arguments
var crnt_dir;
if ((arrow_up) || (arrow_down)){
  crnt_dir = 180;
  if (arrow_up){
    crnt_dir -= 90;
    if (arrow_left){
      crnt_dir += 46;
    }
    if (arrow_right){
      crnt_dir -= 45;
    }
  }
  if (arrow_down){
    crnt_dir += 90;
    if (arrow_left){
      crnt_dir -= 45;
    }
    if (arrow_right){
      crnt_dir += 45;
    }
  }
  if (!pivot_btn){
    image_speed = 0.25;
  }
}else{
  if (arrow_left || arrow_right){
    crnt_dir = 180*arrow_left;
    if (!pivot_btn) {
      image_speed = 0.25;
    }
  }
}
return crnt_dir;
