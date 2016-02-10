var xpos,ypos,output,tiles,target,temp,flag,s;
xpos = argument0;
ypos = argument1;
output = false;

tiles = ds_list_create();

a = floor(ypos/cell_h - xpos/cell_w);
b = floor(ypos/cell_h + xpos/cell_w);
snapx = (b - a)/2*cell_w;
snapy = (b + a)/2*cell_h;

if (jumping){
  target = instance_place(snapx,snapy,obj_terrain_parent);
  //if (place_meeting(xpos,ypos,target) && (abs(target.z - z)>diff || (object_is_ancestor(target.object_index,obj_ramp_parent)&& ramp_pathable(xpos,ypos,target,diff)))){
  if (place_meeting(xpos,ypos,target)){
    ds_list_add(tiles,target);
  }
  
  target = instance_place(snapx-cell_w/2,snapy+cell_h/2,obj_terrain_parent);
  if (place_meeting(xpos,ypos,target)){
    ds_list_add(tiles,target);
  }
  
  target = instance_place(snapx+cell_w/2,snapy+cell_h/2,obj_terrain_parent);
  if (place_meeting(xpos,ypos,target)){
    ds_list_add(tiles,target);
  }
  
  target = instance_place(snapx,snapy+cell_h,obj_terrain_parent);
  if (place_meeting(xpos,ypos,target)){
    ds_list_add(tiles,target);
  }
  
  s = ds_list_size(tiles);
  flag = true;
  if (s > 0){
    for (i=0;i<s;i+=1){
      target = ds_list_find_value(tiles,i);
      if (target.sloped){
        temp = get_slope_z(xpos,ypos,target);
      }else{
        temp = target.z;
      }
      if(temp > z){
        flag = false;
        break;
      }
    }
    output = flag;
  }
}
ds_list_destroy(tiles);
return output;
