var xpos,ypos,output,snapx,snapy,a,b,target,tiles,s;
xpos = argument0;
ypos = argument1;
output = - 1;//default in case of failure

a = floor(ypos/cell_h - xpos/cell_w);
b = floor(ypos/cell_h + xpos/cell_w);
snapx = (b - a)/2*cell_w;
snapy = (b + a)/2*cell_h;
tiles = ds_list_create();


target = instance_place(snapx,snapy,obj_terrain_parent);
if (place_meeting(xpos,ypos,target)){
  ds_list_add(tiles,target);
}

target = instance_place(snapx-cell_w/2,snapy+cell_h/2,obj_terrain_parent);
if (place_meeting(xpos,ypos,target)){
  ds_list_add(tiles,target);}

target = instance_place(snapx+cell_w/2,snapy+cell_h/2,obj_terrain_parent);
if (place_meeting(xpos,ypos,target)){
  ds_list_add(tiles,target);
}

target = instance_place(snapx,snapy+cell_h,obj_terrain_parent);
if (place_meeting(xpos,ypos,target)){
  ds_list_add(tiles,target);
}

l = ds_list_size(tiles);
if(l > 0){
  output = tiles[|0].y;
  for(i=1;i<l;i+=1){
    s = tiles[|i].y;
    if(s>output){
      output = s;
    }
  }
}
ds_list_destroy(tiles);
return room_height - output;
