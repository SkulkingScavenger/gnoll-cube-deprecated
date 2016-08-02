var xpos,ypos;
xpos = argument0;
ypos = argument1;

mp_potential_settings(rot_max,15,check_ahead_distance,true);
mp_potential_step(xpos,ypos,spd,false);
dir_move = point_direction(xprevious,yprevious,x,y);
dir_face = dir_move;
