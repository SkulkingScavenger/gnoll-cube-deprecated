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
