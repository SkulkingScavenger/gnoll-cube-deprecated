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

