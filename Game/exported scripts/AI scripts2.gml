#define AI_main
var scr;
//general upkeep;
AI_global();

//run top script;
scr = ds_list_find_value(cmd_stack,ds_list_size(cmd_stack)-1);
script_execute(scr);

#define AI_idle
///Idle
state = "idle - standby";
//upkeep

//make decision
if(damaged){
  //take damage
  surprised = true;
  battlecry_timer = battlecry_dur;
  ds_list_add(cmd_stack,AI_enter_combat);
  ds_list_add(cmd_stack,AI_knockback);
}else{
  enemies[0] = obj_guy;
  s = 1;
  for(i=0;i<s;i+=1){
    obj = enemies[i];//need to replace this with something more sophisticated later
    if(enemy_detected(obj)){
      //become suspicious
      l_add(cmd_stack,AI_become_suspicious);
      object_of_suspicion = obj;
      suspicion_x = obj.x;
      suspicion_y = obj.y;
      detection_tolerance = suspicion_threshold;
      suspicion_timer = suspicion_duration;
      exit;
    }
  }
  if(random(15)<1){
    origin_x = x;
    origin_y = y;
    if(returning){
      patrol_x = x+128;
      patrol_y = y+128;
    }else{
      patrol_x = x-128;
      patrol_y = y-128;
    }
    returning = !returning;
    ds_list_add(cmd_stack,AI_pace);
  }
}



#define AI_pace
///PACE
state = "idle - pacing";
//upkeep
if(damaged){
  //take damage
  l_pop(cmd_stack);
  surprised = true;
  battlecry_timer = battlecry_dur;
  ds_list_add(cmd_stack,AI_enter_combat);
  ds_list_add(cmd_stack,AI_knockback);
}else{ 
  enemies[0] = obj_guy;
  s = 1;
  for(i=0;i<s;i+=1){
    obj = enemies[i];//need to replace this with something more sophisticated later
    if(enemy_detected(obj)){
      //become suspicious
      l_pop(cmd_stack);
      l_add(cmd_stack,AI_become_suspicious);
      object_of_suspicion = obj;
      suspicion_x = obj.x;
      suspicion_y = obj.y;
      detection_tolerance = suspicion_threshold;
      suspicion_timer = suspicion_duration;
      exit;
    }
  }
  //if no enemy detected, move in direction of pace target
  bub_towards_point(patrol_x,patrol_y);
  if(point_distance(x,y,patrol_x,patrol_y)<spd){
    l_pop(cmd_stack);//end pace
  }
}

#define AI_become_suspicious
state = "idle - high alert";
var obj;
enemies[0] = obj_guy;
enemies[1] = noone;
enemies[2] = noone;
s = 1;
dir_face = rotate_towards_direction(rot_max,dir_face,point_direction(x,y,suspicion_x,suspicion_y));
for(i=0;i<s;i+=1){
  obj = enemies[i];//need to replace this with something more sophisticated later
  if (target_clearly_visible(obj) || detection_tolerance <= 0){
    l_add(enemy_list,obj);
    lastcreated = instance_create(0,0,obj_data);
    lastcreated.target = obj;
    lastcreated.out_of_sight_count = 0;
    l_add(enemy_data,lastcreated);
  }else{
    //turn towards source of disturbance 
    if (enemy_detected(obj)){//check again;
      switch (detection_type){
      case("scent"):
        //you can smell him. you know he's there. so hunt him down "go go go!" "arf! arf! arf!"
        l_add(cmd_stack,AI_aggressive_investigate);
        break;
      case("hearing"):
        if (obj.x != obj.xprevious || obj.y != obj.yprevious || (obj.z == obj.base_z && obj.zprevious != obj.base_z)){
          //I thought I heard something!
          detection_tolerance -= 1;
          suspicion_timer += 10;
          break;
        }
      case("sight"):
        if (obj.x != obj.xprevious || obj.y != obj.yprevious || obj.z != obj.zprevious){
          //whats that over there?
          detection_tolerance -= 1;
          suspicion_timer += 10;
          break;
        }
      }
    }
  }
}
if(!ds_list_empty(enemy_list)){
    target_enemy = obj;
    battlecry_timer = battlecry_dur;
    dir_move = dir_face;
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_enter_combat);
    exit;
}else if(suspicion_timer <= 0){
  l_pop(cmd_stack);//I guess it was nothing
}else{
  suspicion_timer -= 1;//nothings moving. just watch the spot for a while...
}

#define AI_enter_combat
state = "entering combat";

if(battlecry_timer == 0){
  surprised = false;
  l_pop(cmd_stack);
  l_add(cmd_stack,AI_engage); 
}else{
  battlecry_timer -= 1;
}

#define AI_engage
state = "engaging enemy";
//Move Towards enemy, unless other opportunities arise
if(target_is_valid(target_enemy)){
  if(has_los(target_enemy)){
    if(target_in_range(target_enemy,atk_rng)){
      if(atk_ready){
        atk_timer = atk_dur;
        ds_list_add(cmd_stack,AI_attack);
      }else{
        strafe();
      }
    }else{
      close_with_enemy();
      if(target_in_range(target_enemy,atk_rng)){
        if(atk_ready){
          atk_timer = atk_dur;
          ds_list_add(cmd_stack,AI_attack);
        }
      }
    }
  }else if(alternative_target_is_better()){
    switch_target();
  }else{
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_pursue);
    hunt_timer = hunt_duration;
    last_heard_x = target_enemy.x;
    last_heard_y = target_enemy.y;
  }
}else if(other_targets_available()){
  switch_target();
}else{
  l_pop(cmd_stack);
}

#define AI_attack
state = "attacking";
if(atk_timer == 0){
  //execute attack
  l_pop(cmd_stack);
  l_add(cmd_stack,AI_recover);
  recover_timer = recover_dur;
}else{
  atk_timer -= 1;
}

#define AI_recover
state = "recovering from attack";
if(recover_timer == 0){
  atk_ready = false;
  atk_cd_timer = atk_cd;
  l_pop(cmd_stack);
}else{
  recover_timer -= 1;
}

#define AI_knockback
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

#define AI_pursue
state = "pursuing";
if(hunt_timer == 0){
  l_pop(cmd_stack);
  if(other_targets_available()){
    switch_target();
    l_add(cmd_stack,AI_engage);
  }else{
    target_enemy = noone;
  }
}else{
  //chase enemy
  if (has_los(target_enemy)){
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_engage);
    last_heard_x = target_enemy.x;
    last_heard_y = target_enemy.y;
  }else if(alternative_target_is_better()){
    switch_target();
    l_pop(cmd_stack);
    l_add(cmd_stack,AI_engage);
  }else{
    if(sound_heard(target_enemy)){
      close_with_enemy();
      last_heard_x = target_enemy.x;
      last_heard_y = target_enemy.y;
    }else{
      state = "zoning in"
      if(other_targets_available()){
        switch_target();//can't even hear him, so switch targets
        l_pop(cmd_stack);
        l_add(cmd_stack,AI_engage);
      }else{
        state = "confused";
        //keep moving towards the last place you heard him
        mp_potential_step(last_heard_x,last_heard_y,spd,false);
        if(point_distance(last_heard_x,last_heard_y,x,y) < atk_rng){
          //if you're already there, look around
          if((hunt_timer mod 30)==0){
            dir_face += rot_max*floor(random(5));
          }
        }
      }
    }
  }
  hunt_timer -= 1;
}

#define AI_global
///Maintenance

//attack cooldown
if(atk_cd_timer > 0){
  atk_cd_timer -= 1;
  if(atk_cd_timer == 0){
    atk_ready = true;
  }
}

#define alternative_target_is_better
/*
Scroll through enemies and check their total aggro score against the current target
in case of tie, stick with current target.
return the alternative target. if target is the same as current target, return noone
*/
var output,s,obj;
output = false;
s = ds_list_size(enemy_list);
for(i=0;i<s;i+=1){
  obj = l_get(enemy_list,i);
  if(obj != target_enemy){
    if(has_los(obj)){
      if(calculate_aggro(obj) > calculate_aggro(target_enemy)){
        output = true;
      }
    }
  }
}
return output;

#define switch_target
///Switch Target
//sets target_enemy to new target, sets target_enemy to noone if no new targets can be found
var s,obj;
target_enemy = noone;
s = ds_list_size(enemy_list);
for(i=0;i<s;i+=1){
  obj = l_get(enemy_list,i);
  if(target_enemy == noone){
    target_enemy = obj;
  }else{
    if(calculate_aggro(obj)>calculate_aggro(output)){
      target_enemy = obj;
    }
  }
}

#define target_is_valid
var output,target;
target = argument0;
output = true;

  //check if target is still valid
  if (target.hitpoints <= 0){
    output = false;
  }else if (point_distance(x,y,target.x,target.y) > pursuit_range){
    output = false; //too far to chase
  }else if (!path_to_target_exists(target)){
    output = false; //if the path can't be found or is too long, give up. (can't imagine when this would happen though)
  }

return output;

#define target_in_range
var obj,range,output;
obj = argument0;
range = argument1;
output = (point_distance(x+w/2,y+h/2,obj.x+obj.w/2,obj.y+obj.h/2)) <= range;
return output;

#define other_targets_available
var output,target,s;
output = false;
s = ds_list_size(enemy_list);

for(i=0;i<s;i+=1){
  target = ds_list_find_value(enemy_list,i){
    if (target != target_enemy){
      if target_is_valid(target){
        output = true;
        break;
      }
    }
  }
}

return output;

#define check_for_enemies
/*
for each enemy in range
run LOS routine
if LOS returns true, add to list.
NOTE: this routine is meant to be called from a non-idle state. assume enemy_list is not empty
*/

//compile a list of all enemies that can be seen or heard

#define has_los
var obj,xpos,ypos,zpos,output,tolerance,x_dist,y_dist,dir,target,divisible_by_two,top,left;

obj = argument0;
xpos = obj.x;
ypos = obj.y;
zpos = z;
tolerance = z_tolerance;

x_dist = ceil(abs(x-xpos)/cell_w)+2;//positive if x > xpos (if east of obj)
y_dist = ceil(abs(y-ypos)/cell_h)+2;//positive if y > ypos (if south of obj)
top = min(obj.y,y)-cell_h/2;
left = min(obj.x,x)-cell_w/2;
target = instance_place(top,left,obj_terrain_parent);
for(i=0;i<y_dist;i+=1){
  divisible_by_two = i mod 2;
  for(j=0;j<x_dist;j+=1){
    target = instance_position(left+j*cell_w+divisible_by_two*(cell_w/2),top+i*cell_h/2,obj_terrain_parent);
    with (target){
      if(collision_line(x,y,xpos,ypos,target,true,false)){
        if(target.z-tolerance > zpos){
          return false;
        }else{
          if(place_meeting(x,y,obj_doodad_parent)){
            if(instance_place(x,y,obj_doodad_parent).blocks_los){
              return false;
            }
          }
        }
      }
    }
  }
}
output = true;
return output;

/*


#define manage_enemy_list
//check if old enemies are no longer remembered
var s, enemies,flag,data;
s = ds_list_size(enemy_list)
for(i=s-1;i>=0;i+=1){
  obj = l_get(enemy_list,i);
  data = l_get(enemy_data,i);
  if(obj != target_enemy){
    if(!has_los(obj) && !sound_heard(obj)){
      if( data.out_of_sight_count > out_of_sight_duration){
        l_del(enemy_list,i);
        l_del(enemy_data,i);
        with(data){instance_destroy();}
      }else{
        data.out_of_sight_count += 1;
      }
    }else{
      data.out_of_sight_count = 0;
    }
  }
}

/*
s = player_count;
for(i=0;i<s;i+=1){
  obj = player[i];
  if(ds_list_find_index(enemy_list,obj) == -1){
    if(!has_los(obj) && !sound_heard(obj)){
      if( data.out_of_sight_count > out_of_sight_duration){
        l_del(enemy_list,i);
        l_del(enemy_data,i);
        with(data){instance_destroy();}
      }else{
        data.out_of_sight_count += 1;
      }
    }else{
      data.out_of_sight_count = 0;
    }
  }
}

#define scent_smelled
obj = argument0;
return target_in_range(obj,scent_radius);

#define sound_heard
var obj, output;
obj = argument0;
output = false;
//sneakiness formula
if(obj.sneakiness >= detection){
  detection_radius = vision_radius*(detection/(2*obj.sneakiness));
}else{
  detection_radius = vision_radius*(1-(obj.sneakiness/2*detection));
}
//if has moved or landed from a jump
if(obj.x != obj.xprevious || obj.y != obj.yprevious || (obj.z == obj.base_z && obj.zprevious != obj.base_z)){
  output = target_in_range(obj,detection_radius);
}
return output;

#define enemy_detected
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

#define glimpse_caught
var obj,output;
obj = argument0;
output = false;
if(degree_difference(point_direction(x,y,obj.x,obj.y),dir_face) <= 90){//if in range of peripherals
  if(degree_difference(point_direction(x,y,obj.x,obj.y),dir_face) <= 30){
    peripheral_radius = vision_radius;
  }else{
    peripheral_radius = vision_radius/2;
  }
  if(target_in_range(obj,peripheral_radius)){
    if(has_los(obj)){
      if(is_illuminated(obj)){
        output = true;
      }
    }
  }
}
return output;

#define is_illuminated
var obj;
obj = argument0;
return true;

#define target_clearly_visible
var obj,output;
obj = argument0;
output = false;
if(degree_difference(point_direction(x,y,obj.x,obj.y),dir_face) <= 30){
  if(target_in_range(obj,vision_radius)){
    if(has_los(obj)){
      if(is_illuminated(obj)){
        output = true;
      }
    }
  }
}
return output;

#define strafe
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

#define close_with_enemy
///Close With Enemy
//mp_grid_path(mp_grid,path,x,y,target_enemy.x,target_enemy.y,false);
mp_potential_settings(rot_max,15,check_ahead_distance,true);
mp_potential_step(target_enemy.x,target_enemy.y,spd,false);
dir_move = point_direction(xprevious,yprevious,x,y);
dir_face = dir_move;

#define bub_towards_point
var xpos,ypos;
xpos = argument0;
ypos = argument1;

mp_potential_settings(rot_max,15,check_ahead_distance,true);
mp_potential_step(xpos,ypos,spd,false);
dir_move = point_direction(xprevious,yprevious,x,y);
dir_face = dir_move;

#define path_is_reusable
/**
Check if path is reusable
while copying the stacks, check
compare the length of the path with the distance of the target
*/
/*
var target,temp_x,temp_y,xpos,ypos,xprev,yprev,path_len,modifier,threshold,output,dist;
target = argument0;
threshold = atk_rng;
modifier = 0.1;
output = false;
path_len = 0;
temp_x = ds_stack_create();
temp_y = ds_stack_create();
ds_stack_copy(temp_x,path.nodes_x);
ds_stack_copy(temp_y,path.nodes_y);
xpos = x;
ypos = y;
while(!ds_stack_empty(temp_x)){
  xprev = xpos;
  yprev = ypos;
  xpos = s_pop(temp_x);
  ypos = s_pop(temp_y);
  path_len += point_distance(xprev,yprev,xpos,ypos);
  dist = point_distance(xpos,ypos,target.x,target.y);
  if(dist < threshold+path_len*modifier && dist<point_distance(x,y,target.x,target.y)){
    output = true;
    break;
  }
}
ds_stack_destroy(temp_x);
ds_stack_destroy(temp_y);
*/
var output,target;
target = argument0;
dist = point_distance(target.x,target.y,initial_x,initial_y);
output = (dist < atk_rng);
return output;


#define calculate_aggro
var target,aggro;
target = argument0;

if(ds_list_find_index(enemy_list,target) == -1){
  aggro = 0;
}else{
  aggro = 1;//fix this later moron
}
return aggro;

/*
Basic
if has LoS: + 25
if has peripheral LoS + 50
if can hear him: + 50

if distance < threat_range: + 50

if 

#define path_to_target_exists
var target,output;
target = argument0;
return true;

#define rotate_towards_direction
var amount,crnt_angle,target_angle,output;
amount = argument0;
crnt_angle = argument1;
target_angle = argument2;
output = 0;

if(degree_difference(crnt_angle,target_angle)>amount){
  if(degree_difference(crnt_angle+1,target_angle)<degree_difference(crnt_angle-1,target_angle)){
    output = target_angle + amount;
  }else{
    output = target_angle - amount;
  }
}else{
  output = target_angle;
}
return output;

