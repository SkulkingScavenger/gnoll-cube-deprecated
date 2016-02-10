var dest_x,dest_y,max_dist,destination,start,crnt,i,path,f_score,open,closed;
dest_x = argument0;
dest_y = argument1;
max_dist = argument2;
//SET UP*********************************************
path = instance_create(0,0,obj_path);
open = ds_map_create();
closed = ds_map_create();
destination = instance_position(dest_x+cell_w/2,dest_y+cell_h/2,obj_terrain_parent);
start = instance_position(x+w/2,y+w/2,obj_terrain_parent);
if(start == noone){
  show_message(dest_x);
  show_message(dest_y);
}
crnt = start;
crnt.previous = noone;
crnt.g = 0;
f_score = ds_map_create();
estimated_distance = node_distance(start,destination);//estimate distance
m_add(open,crnt,estimated_distance);//add start to Open Set
temp_list = ds_list_create();// create a list
l_add(temp_list,crnt);// put the node in the list
m_add(f_score,estimated_distance,temp_list);//put that list in a hashtable
//BEGIN LOOP
while(ds_map_size(open)>0){//while openSet !empty
  //DEAL WITH CURRENT NODE********************************************
  //get current node
  crnt = b_get(f_score,ds_map_find_first(f_score),0);//retrieve top node from f_score
  b_del(f_score,ds_map_find_first(f_score),0); // delete that node from f_score
  ds_map_delete(open,crnt);//delete that node from the Open Set
  ds_map_add(closed,crnt,0); //add it to the Closed Set
  //CHECK FOR END CONDITIONS*******************************************
  if (crnt == destination){
    //start with destination and trace back to origin
    while(crnt.previous != noone){
      ds_stack_push(path.nodes_x,crnt.x);
      ds_stack_push(path.nodes_y,crnt.y);
      crnt = crnt.previous;
    }
    ds_map_destroy(open);
    ds_map_destroy(closed);
    bucket_destroy(f_score);
    return path;
  }
  //BEGIN SEARCH**************************************************************
  adjacent[0] = instance_position(crnt.x+cell_w/2+cell_w/2,crnt.y+cell_h/2+cell_h/2,obj_terrain_parent);
  adjacent[1] = instance_position(crnt.x+cell_w/2+cell_w/2,crnt.y+cell_h/2-cell_h/2,obj_terrain_parent);
  adjacent[2] = instance_position(crnt.x+cell_w/2-cell_w/2,crnt.y+cell_h/2+cell_h/2,obj_terrain_parent);
  adjacent[3] = instance_position(crnt.x+cell_w/2-cell_w/2,crnt.y+cell_h/2-cell_h/2,obj_terrain_parent);
  for(i=0;i<4;i+=1){
    neighbor = adjacent[i];
    if(neighbor){
      if(!ds_map_exists(closed,neighbor)){
        //IGNORE CLOSED SET
        //Check If Pathable
        if(node_path_pathable(crnt,neighbor,ceil(w/cell_w))){
          if(!ds_map_exists(open,neighbor)){
            //move it to the open map and calculate cost
            neighbor.g = max_dist+1;
            neighbor.f = noone;
            neighbor.previous = noone;
            m_add(open,neighbor,max_dist+1);
          }
          //UPDATE NODE
          update_node(crnt,neighbor,open,f_score,destination);
        }
      }
    }
  }
}
//searched everywhere, but did not find the destination
with(path){instance_destroy();}
path = noone;
ds_map_destroy(open);
ds_map_destroy(closed);
bucket_destroy(f_score);
return path;
