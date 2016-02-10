var xpos,ypos,dist,dist_previous,enemy_move_dir,;
enemy_dir = point_direction(target_enemy.xprevious,target_enemy.yprevious,target_enemy.x,target_enemy.y)
dist = point_distance(x,y,target_enemy.x,target_enemy.y);
dist_previous = point_distance(x,y,target_enemy.xprevious,target_enemy.yprevious);
if(dist > dist_previous){
  //he's running away
  //take a small step
}else if(dist < dist_previous){
  //he's charging
  //backstep
}else{
  //he's not directly away
  //sidestep
}
