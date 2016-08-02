var xpos,ypos,dist,dist_previous,enemy_move_dir,dir;
enemy_dir = point_direction(target_enemy.xprevious,target_enemy.yprevious,target_enemy.x,target_enemy.y)
dist = point_distance(x,y,target_enemy.x,target_enemy.y);
dist_previous = point_distance(xprevious,yprevious,target_enemy.xprevious,target_enemy.yprevious);
if(dist > dist_previous){
  //mp_grid_path(mp_grid,path,x,y,target_enemy.x,target_enemy.y,false);
  mp_potential_settings(180,15,check_ahead_distance/2,true);
  mp_potential_step(target_enemy.x,target_enemy.y,spd,false);
}else if(dist < dist_previous){
  //he's charging
  //backstep
  dir = point_direction(target_enemy.x,target_enemy.y,x,y);
  mp_potential_settings(180,15,check_ahead_distance/2,true);
  mp_potential_step(x+spd*dcos(dir),y+spd*dsin(dir),spd,false);
}else{
  //he's not directly away
  //sidestep
  dir = point_direction(target_enemy.x,target_enemy.y,x,y)+90;
  mp_potential_settings(180,15,check_ahead_distance/2,true);
  mp_potential_step(x+spd*dcos(dir),y+spd*dsin(dir),spd,false);
}

dir_move = point_direction(xprevious,yprevious,x,y);
dir_face = point_direction(x,y,target_enemy.x,target_enemy.y);
