///Close With Enemy
//mp_grid_path(mp_grid,path,x,y,target_enemy.x,target_enemy.y,false);
mp_potential_settings(rot_max,15,check_ahead_distance,true);
mp_potential_step(target_enemy.x,target_enemy.y,spd,false);
dir_move = point_direction(xprevious,yprevious,x,y);
dir_face = dir_move;
