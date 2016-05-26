///move generic
/*
xspd = displacement on x axis
yspd = displacement on y axis
*/

pivoting = pivot_btn;
strafing = strafe_btn;

//check keyboard input to determine maximum displacement
if (arrow_left){
  xspd = -1*(crnt_spd + spdmod);
}
if (arrow_right){
  xspd = (crnt_spd + spdmod);
}
if (arrow_up){
  yspd = -1*(crnt_spd + spdmod);
}
if (arrow_down){
  yspd = (crnt_spd + spdmod);
}
//if sneaking = true, modify total speed to account for it
if (sneaking){
  xspd = floor(xspd*sneak_mod+1);
  yspd = floor(yspd*sneak_mod+1);
}

if(!arrow_left && !arrow_right){
  xspd = 0;
}
if(!arrow_up && !arrow_down){
  yspd = 0;
}

dir_move = speed_direction(xspd,yspd,dir_move);

if (!strafing && !stunned){
  dir_face = dir_move;
}


//xspd = lengthdir_x(crnt_spd,dir_move);
//yspd = lengthdir_y(crnt_spd,dir_move);
//if conditions permit, move desired amount
if (!pivoting && !snared && !channeling && !stunned && controlling_player == crnt_pnum && !instance_exists(obj_menu_parent)){
  if (point_pathable(x+xspd,y+yspd,2) || aerial_point_pathable(x+xspd,y+yspd)){
    x += xspd;
    y += yspd;
  }else{
    //move as far as possible in the desired direction
    move_contact_nonpathable(dir_move,crnt_spd,max_diff);
    //move_contact_all(dir_move,crnt_spd);
    if (!point_pathable(x+xspd,y,2) && !aerial_point_pathable(x+xspd,y)){
      move_contact_nonpathable(270+sign(xspd)*90,xspd,max_diff);
      //move_contact_all(270+sign(xspd)*90,xspd);
      xspd = 0;
    }else{
      x += xspd;
    }
    if (!point_pathable(x,y+yspd,max_diff)&& !aerial_point_pathable(x,y+yspd)){
      move_contact_nonpathable(180+sign(yspd)*90,yspd,max_diff);
      //move_contact_all(270+sign(xspd)*90,xspd);
      yspd = 0;
    }else{
      y += yspd;
    }
  }
}

a = round((y+cell_h/2)/cell_h - (x+cell_w/2)/cell_w);
b = round((y+cell_h/2)/cell_h + (x+cell_w/2)/cell_w);
ground = instance_position((b - a)/2*cell_w,(b + a)/2*cell_h,obj_terrain_parent);
if(!ground){exit;}
if (ground.sloped){
  base_z = get_slope_z(x,y,ground);
}else{
  base_z = ground.z;
}
if (!jumping){
  z = base_z;
}else{
  z += z_spd;
  if (base_z > z){
    jumping = false;
    z = base_z;
    zspd = 0;
    if (!point_pathable(x,y,max_diff)){
      snap_to_pathable(max_diff);
    }
  }else{
    z_spd -= 1;
  }
}
