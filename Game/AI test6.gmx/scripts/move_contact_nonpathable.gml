var len, dir, diff, xpos, ypos,s, pathable,oldx,oldy,oldlen,i,j;
dir = argument0;
len = argument1;
diff = argument2;
pathable = true;
xpos = x;
ypos = y;
s = ceil((len*2)/cell_h);//number of jumps = distance/cell_w
for(j=0;j<s;j+=1){  
  oldx = xpos;
  oldy = ypos;
  oldlen = len;
  if(len >= cell_h/2){
    xpos += lengthdir_x(cell_h/2,dir);
    ypos += lengthdir_y(cell_h/2,dir);
    len -= cell_h;
  }else{
    xpos += lengthdir_x(len,dir);
    ypos += lengthdir_y(len,dir);
  }
  pathable = point_pathable(xpos,ypos,diff);
  if (!pathable){
    xpos = oldx;
    ypos = oldy;
    nearby_objects = ds_list_create();
    a = round(ypos/cell_h - xpos/cell_w);
    b = round(ypos/cell_h + xpos/cell_w);
    snapx = (b - a)/2*cell_w;
    snapy = (b + a)/2*cell_h;
    snapy -= cell_h;
    //get the 9 objects within cell_h of x,y
    for(i=0;i<9;i+=1){
      target = instance_place(snapx + (i mod 3)*(cell_w/2) - (i div 3)*(cell_w/2),snapy + (i mod 3)*(cell_h/2) + (i div 3)*(cell_h/2),obj_terrain_parent);
      if (place_meeting(xpos,ypos,target)){
        ds_list_add(nearby_objects,target);
      }
    }
    //
    l = ds_list_size(nearby_objects);
    for(i=0;i<l;i+=1){
      with (ds_list_find_value(nearby_objects,i)){
        TEMP = solid;
        solid = true;
      }
    }
    move_contact_solid(dir,cell_h/2);
    for(i=0;i<l;i+=1){
      with (ds_list_find_value(nearby_objects,i)){
        solid = TEMP;
      }
    }
    ds_list_destroy(nearby_objects);
    break;
  }
}
x = xpos;
y = ypos;




