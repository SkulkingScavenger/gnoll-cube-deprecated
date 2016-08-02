//0 means impossible, 1 means success
var diff,output,snapx,snapy,a,b,target,safe,s,nearest;
diff = argument0;
safe = ds_list_create();
a = floor(y/cell_h - x/cell_w);
b = floor(y/cell_h + x/cell_w);
snapx = (b - a)/2*cell_w;
snapy = (b + a)/2*cell_h;
output = 1;

//find which adjacent squares are safe
target = instance_place(snapx,snapy,obj_terrain_parent);
//if (place_meeting(xpos,ypos,target) && (abs(target.z - z)>diff || (object_is_ancestor(target.object_index,obj_ramp_parent)&& ramp_pathable(xpos,ypos,target,diff)))){
if (place_meeting(x,y,target) && abs(target.z - z)>diff && !object_is_ancestor(target.object_index,obj_ramp_parent)){
  ds_list_add(safe,target);
}

target = instance_place(snapx-cell_w/2,snapy+cell_h/2,obj_terrain_parent);
if (place_meeting(x,y,target) && abs(target.z - z)>diff && !object_is_ancestor(target.object_index,obj_ramp_parent)){
  ds_list_add(safe,target);
}

target = instance_place(snapx+cell_w/2,snapy+cell_h/2,obj_terrain_parent);
if (place_meeting(x,y,target) && abs(target.z - z)>diff && !object_is_ancestor(target.object_index,obj_ramp_parent)){
  ds_list_add(safe,target);
}

target = instance_place(snapx,snapy+cell_h,obj_terrain_parent);
if (place_meeting(x,y,target) && abs(target.z - z)>diff && !object_is_ancestor(target.object_index,obj_ramp_parent)){
  ds_list_add(safe,target);
}


s = ds_list_size(safe);
if (s == 0){
  output = 0;
}else{
  //find the closest safe spot
  nearest = ds_list_find_value(safe,0);
  a = point_distance(x,y,nearest.x,nearest.y);
  for(i=1;i<s;i+=1){
    target = ds_list_find_value(safe,i);
    if (point_distance(x,y,target.x,target.y)<a){
      nearest = target;
    }
  }
  //snap to nearest safe spot
  x = nearest.x;
  y = nearest.y;
}
ds_list_destroy(safe);

return output;
