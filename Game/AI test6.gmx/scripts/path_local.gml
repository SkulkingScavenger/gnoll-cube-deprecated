var px, py, ox, oy, dx, dy, qx, qy, p_angle, dist, orientation,trunc_diff;
ox = x;
oy = y;
dx = argument0;
dy = argument1;
orientation = argument2;
trunc_diff = argument3;


p_angle = dir_initial;
p_angle += 90*orientation;

//calculate pivot
px = round(ox + lengthdir_x(rot_r,p_angle));
py = round(oy + lengthdir_y(rot_r,p_angle));

dist = point_distance(dx,dy,px,py);
if(dist < rot_r){
  return false;
}

//calculate end of arc
theta = darccos(rot_r/dist);
phi = darctan2(dy-py,dx-px);
qx = round(px + rot_r*dcos(phi + theta*orientation));
qy = round(py + rot_r*dsin(phi + theta*orientation));


//get segments
var crnt_a,a,b,c;
a = point_distance(ox,oy,px,py);
b = point_distance(px,py,qx,qy);
c = point_distance(ox,oy,qx,qy);
crnt_a = hammer_of_cosine(a,b,c);

//create segmented arc
var target1,target2,crnt_x,crnt_y,prev_x,prev_y,i;
draw_set_color(c_green);
segment_count = floor(crnt_a/45);
crnt_x = ox;
crnt_y = oy
crnt_a = dir_initial + (180 - 90*orientation);
target2 =  instance_position(ox,oy,obj_terrain_parent);
for(i=0;i<segment_count;i+=1){
  prev_x = crnt_x;
  prev_y = crnt_y;
  crnt_a += 45*orientation;
  crnt_x = round(px - rot_r*dcos(crnt_a));
  crnt_y = round(py + rot_r*dsin(crnt_a));
  target1 = instance_position(prev_x,prev_y,obj_terrain_parent);
  target2 = instance_position(crnt_x,crnt_y,obj_terrain_parent);
  s_push(localpath.nodes_x,crnt_x);
  s_push(localpath.nodes_y,crnt_y);
  if (!line_pathable(prev_x,prev_y,crnt_x,crnt_y,ceil(w/cell_w))){
    return false;
  }
}
s_push(localpath.nodes_x,qx);
s_push(localpath.nodes_y,qy);
s_push(localpath.nodes_x,dx);
s_push(localpath.nodes_y,dy);
target1 = instance_position(qx,qy,obj_terrain_parent);
if(!line_pathable(crnt_x,crnt_y,qx,qy,ceil(w/cell_w))){
  return false;
}
target2 = instance_position(dx,dy,obj_terrain_parent);
if(!line_pathable(qx,qy,dx,dy,ceil(w/cell_w))){
  return false;
}
//If you made it this far, return true
return true;
