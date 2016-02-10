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
3. if all tiles are less than "max_diff" away from z
4. and
5. if max_z is less than "max_diff" away from min_z
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
  if (abs(a-zpos) <= max_diff && abs(b-zpos) <= max_diff){
    output = true;
  }
}

ds_list_destroy(tiles);
return output;
