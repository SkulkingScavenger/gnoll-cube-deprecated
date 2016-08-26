#define nodes_in_path
var dx,dy,x1,y1,x2,y2,w,obj,xpos,ypos,xprev,yprev,D,swap,s1,s2,output,i,target;
x1 = argument0;
y1 = argument1-1;
x2 = argument2;
y2 = argument3-1;
w = argument4;
output = ds_map_create();
xpos = x1; ypos = y1;
dx = abs(x2 - x1); dy = abs(y2 - y1);
s1 = sign(x2 - x1); s2 = sign(y2 - y1);
swap = 0;
if (dy > dx) {temp = dx; dx = dy; dy = temp; swap = 1;}
//plot(x0,y0)
D = 2*dy - dx;
xprev = xpos; yprev = ypos;
for (i = 0; i < dx; i+=1) {
  if(instance_position(xprev,yprev,obj_terrain_parent)!= instance_position(xpos,ypos,obj_terrain_parent)){
    //top
    target = instance_position(xpos+cell_w/2*w,ypos,obj_terrain_parent);
    if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
    //bottom
    target = instance_position(xpos+cell_w/2*w,ypos+cell_h*w,obj_terrain_parent);
    if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
    //left
    target = instance_position(xpos,ypos+cell_h*w/2*w,obj_terrain_parent);
    if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
    //right
    target = instance_position(xpos+cell_w*w,ypos+cell_h/2*w,obj_terrain_parent);
    if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
  }
  xprev = xpos; yprev = ypos;
  while (D >= 0){
    D = D - 2*dx; if (swap) xpos += s1; else ypos += s2;
  }
  D = D + 2*dy; if (swap) ypos += s2; else xpos += s1;
}
return output;

#define objects_in_line
var dx,dy,x1,y1,x2,y2,obj,xpos,ypos,D,swap,s1,s2,output,i,target;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
obj = argument4;
output = ds_map_create();
xpos = x1; ypos = y1;
dx = abs(x2 - x1); dy = abs(y2 - y1);
s1 = sign(x2 - x1); s2 = sign(y2 - y1);
swap = 0;
if (dy > dx) {temp = dx; dx = dy; dy = temp; swap = 1;}
//plot(x0,y0)
D = 2*dy - dx;
for (i = 0; i < dx; i+=1) {
target = instance_position(xpos,ypos,obj);
if(target){if (!ds_map_exists(output,target)){ds_map_add(output,target,0)}}
while (D >= 0)
{D = D - 2*dx; if (swap) xpos += s1; else ypos += s2;}
D = D + 2*dy; if (swap) ypos += s2; else xpos += s1;
}
return output

#define get_iso_area
var xpos,ypos,w,xorigin,yorigin,a,b,output,i,tile_count;
xpos = argument0;
ypos = argument1;
w = argument2;
xpos += (cell_w/2)*w;//compensate for origin offset
tile_count = (w+1)*(w+1);//width of general area needed to contain width of object is w+1
output = ds_list_create();
a = round(ypos/cell_h - xpos/cell_w);
b = round(ypos/cell_h + xpos/cell_w);
xorigin = (b - a)/2*cell_w - cell_w/2;
yorigin = (b + a)/2*cell_h - cell_h/2;

for(i=0;i<tile_count;i+=1){
  xpos = xorigin + (i mod (w+1))*(cell_w/2) - (i div (w+1))*(cell_w/2);
  ypos = yorigin + (i mod (w+1))*(cell_h/2) + (i div (w+1))*(cell_h/2);
  target = instance_position(xpos+cell_w/2,ypos+cell_h/2,obj_terrain_parent);
  if(target != noone){
    ds_list_add(output,target);
  }
}
return output;

#define get_tiles_at_point
var xpos,ypos,w,xorigin,yorigin,a,b,output,i,tile_count;
x_initial = argument0;
y_initial = argument1;
w = argument2;
xpos = x_initial;
ypos = y_initial;

xpos += (cell_w/2)*w;//compensate for origin offset
tile_count = (w+1)*(w+1);//width of general area needed to contain width of object is w+1
output = ds_list_create();
a = round(ypos/cell_h - xpos/cell_w);
b = round(ypos/cell_h + xpos/cell_w);
xorigin = (b - a)/2*cell_w - cell_w/2;
yorigin = (b + a)/2*cell_h - cell_h/2;

for(i=0;i<tile_count;i+=1){
  xpos = xorigin + (i mod (w+1))*(cell_w/2) - (i div (w+1))*(cell_w/2);
  ypos = yorigin + (i mod (w+1))*(cell_h/2) + (i div (w+1))*(cell_h/2);
  target = instance_position(xpos+cell_w/2,ypos+cell_h/2,obj_terrain_parent);
  if(target != noone){
    if(place_meeting(x_initial,y_initial,target)){
      ds_list_add(output,target);
    }
  }
}
return output;

#define point_pathable
var xpos,ypos,w,zpos,output,snapx,snapy,a,b,target,tiles,s,temp;
xpos = argument0;
ypos = argument1;
w = argument2;

zpos = ground_z_shift(xpos,ypos);
output = false;

a = floor(ypos/cell_h - xpos/cell_w);
b = floor(ypos/cell_h + xpos/cell_w);
snapx = (b - a)/2*cell_w;
snapy = (b + a)/2*cell_h;
tiles = ds_list_create();


tiles = get_tiles_at_point(xpos,ypos,w);


/*
1. go through the tiles.
2. for sloped tiles, z = get_slope_z, for non-slopes, z = z;
3. if all tiles are less than "max_z_diff" away from z
4. and
5. if max_z is less than "max_z_diff" away from min_z
6. output = true
*/
s = ds_list_size(tiles);
if (s > 0){
  target = ds_list_find_value(tiles,0);
  if (target.sloped){
    a = get_slope_z(xpos,ypos,target);
    b = get_slope_z(xpos,ypos,target);
  }else{
    a = target.z;//max
    b = target.z;//min
  }
  for(i=1;i<s;i+=1){
    target = ds_list_find_value(tiles,i);
    if (target.sloped){
      temp = get_slope_z(xpos,ypos,target);
    }else{
      temp = target.z;
    }
    if (temp > a){
      a = temp;
    }
    if (temp < b){
      b = temp;
    }
  }
  if (abs(a-zpos) <= max_z_diff && abs(b-zpos) <= max_z_diff){
    output = true;
  }
}

ds_list_destroy(tiles);
return output;

#define edge_pathable
var node_a,node_b,output,flat,sloped;
node_a = argument0;
node_b = argument1;
output = false;
if (abs(node_a.z - node_b.z)<=max_z_diff){
  output = true;
}else if(node_a.sloped || node_b.sloped){
  //run a bunch of checks
  //we already know that the z's are unequal
  if(node_a.sloped && node_b.sloped){
    //if they are facing the same way and the gap in the z is less than the height
    //assumes the slopes have equal steepness
    if(node_a.slope == node_b.slope && abs((node_a.z)-(node_b.z)) <= node_a.d){
      output = true;
    }
  }else{
    //do the tricky bit
    if(node_a.sloped){
      sloped = node_a;
      flat = node_b;
    }else{
      sloped = node_b;
      flat = node_a;
    }
    if (sloped.z > flat.z){
      //going down
      //but the bottom of the ramp should equal the z of the bottom tile, which we know isn't the case
      output = false;
    }else{
      //going up
      if (abs(flat.z - sloped.z+sloped.d)<=max_z_diff){
        output = true;
      }else{output = true;}//no idea whats going on
    }
  }
}
return output;


#define line_pathable
var x1,y1,x2,y2,w,path,output,crnt,adjacent,open,closed;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
w = argument4;
output = true;
//map = objects_in_line(node_a.x + cell_w/2,node_a.y + cell_h/2,node_b.x + cell_w/2,node_b.y + cell_h/2,obj_terrain_parent);
path = nodes_in_path(x1,y1,x2,y2,w);
open = ds_map_create();
closed = ds_map_create();

output = true;
m_add(open,ds_map_find_first(path),0);
while(!ds_map_empty(open)){
  crnt = ds_map_find_first(open);
  m_add(closed,crnt,0);
  ds_map_delete(open,crnt);
  for(i=0;i<4;i+=1){
    if(ds_map_exists(path,crnt.adjacent[i])&& !ds_map_exists(closed,crnt.adjacent[i])){
      if (crnt.pathable[i]){
        m_add(open,crnt.adjacent[i],0);
      }else{
        output = false;
        break;
      }
    }
  }
  if(!output){break;} 
}
ds_map_destroy(open);
ds_map_destroy(closed);
ds_map_destroy(path);
return output;


#define region_pathable
var xpos,ypos,w,node,node_a,node_b,zpos,output,tiles,temp,i,j;
xpos = argument0;
ypos = argument1;
w = argument2;
node = instance_position(xpos,ypos,obj_terrain_parent);

/*
if(!point_hypothetically_pathable(node_a,node_b,max_z_diff)){
  return false;
}
*/
//center the searched region on the node(or on the intersection below the node if w is odd)
if(node != noone){
  xpos = node.x - cell_w/2*(w-1);
  ypos = node.y - cell_h/2*(w-1);
}else{
  show_message(xpos);
  show_message(ypos);
}

//tiles = get_iso_area(xpos,ypos,w);
tiles = get_iso_area(xpos,ypos,w);
output = true;
var i,j,s;
s = ds_list_size(tiles);
for(i=0;i<s;i+=1){
  node_a = l_pop(tiles);
  if(node_a != noone){
    for(j=0;j<ds_list_size(tiles);j+=1){
      node_b = ds_list_find_value(tiles,j);
      if(node_b != noone){
        if(abs(node_a.x-node_b.x)==cell_w/2 && abs(node_a.y-node_b.y)==cell_h/2){//if an adjacent tile
          if(!edge_pathable(node_a,node_b,max_z_diff)){
            ds_list_destroy(tiles);
            return false;
            /*
            Theorem for only comparing orthogonal tiles:
            let A and C be tiles sharing sides with B and D, and a point with each other
            if B and C are pathable with respect to A, and B and C are pathable with respect to D
            A is pathable with respect to D
            */
          }
        }
      }
    }
  }
}

ds_list_destroy(tiles);
return output;

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

#define l_del
ds_list_delete(argument0,argument1);

#define l_get
ds_list_find_value(argument0,argument1);

#define m_get
ds_map_find_value(argument0,argument1);

#define l_pop
var l,list,output;
list = argument0;
l = ds_list_size(list);
output = ds_list_find_value(list,l-1);
ds_list_delete(list,l-1);
return output;

#define l_add
ds_list_add(argument0,argument1);

#define m_add
ds_map_add(argument0,argument1,argument2);

#define l_clear
ds_list_clear(argument0);

#define s_pop
return ds_stack_pop(argument0);

#define s_push
ds_stack_push(argument0,argument1);

#define degree_difference
var a,b;
a = argument0 mod 360;
b = argument1 mod 360;
return 180 - abs(abs(a - b) - 180);

