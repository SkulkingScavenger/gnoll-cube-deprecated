var x1,y1,x2,y2,h,w,slope,output,distance,a,b,target,xpos,ypos;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;


w = x1 - x2;
h = y1 - y2;
if(w != 0){
  slope = h/w;
}else{
  slope = 0;
  if(y1 > y2){
    ypos = y1;
    y1 = y2;
    y2 = ypos;
  }
  distance = (y2 - y1);
  for (i=0;i<distance;i+=1){
    //do stuff
  }
  exit;
}
distance = sqrt(w*w + h*h);
output = ds_list_create();
xpos = x1;
ypos = y1;
for(i=0;i<w;i+=1){
  //find the terrain tile at the given point
  a = floor(xpos/16)*16; //move to the top of the tile
  b = floor(xpos/16)*16 + ((a/16) mod 2)*32; //move to the left edge. possibly shift another 16
  target = instance_position(a,b,obj_terrain_parent); //get tile
  ds_list_add(output,target);
  while(i<w && point_in_tile(xpos,ypos,target)){
    xpos += 1;
    ypos = xpos*slope;
    i+=1;
  }
}
return output;
