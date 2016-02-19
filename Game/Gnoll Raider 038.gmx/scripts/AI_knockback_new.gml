state = "knocked back";
if(knockback_timer == 0){
  l_pop();
}else{
  knockback_timer -= 1;
  xpos = x + knockback_spd*cos(degtorad(dir_knockback));
  ypos = y + knockback_spd*sin(degtorad(dir_knockback));
  if(point_pathable(xpos,ypos,ceil(w/cell_w))){
    x = xpos;
    y = ypos;
  }
}
