var dist,dir,output,xpos,ypos;
xpos = argument0;
ypos = argument1;

dist = floor(point_distance(x,y,xpos,ypos));
if (spd_remaining < dist){
  dir = point_direction(x,y,xpos,ypos);
  x += floor(lengthdir_x(spd,dir));
  y += floor(lengthdir_y(spd,dir));
  spd_remaining = 0;
  output = 0;//could not reach target
}else{
  x = xpos; 
  y = ypos;
  spd_remaining -= abs(dist);//reached target
  output = 1;
}
dir_move = point_direction(xprevious,yprevious,x,y);
/*
if(!point_pathable(x,y,ceil(w/cell_w))){
  output = -1;
  show_message("YOU FOOOOOOOOOL!!!");//You blew it. I don't know how, but you did, so you get -1.
}
*/
return output;
