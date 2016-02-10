var xpos,ypos,w,node,node_a,node_b,zpos,diff,output,tiles,temp,i,j;
xpos = argument0;
ypos = argument1;
w = argument2;
node = instance_position(xpos,ypos,obj_terrain_parent);
diff = max_diff;
/*
if(!point_hypothetically_pathable(node_a,node_b,diff)){
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
          if(!edge_pathable(node_a,node_b,diff)){
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
