var x1,y1,x2,y2,w,path,output,crnt,adjacent,open,closed;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
w = argument4;
path = nodes_in_path(x1,y1,x2,y2,w);
open = ds_map_create();
closed = ds_map_create();

output = true;
m_add(open,ds_map_find_first(path),0);
while(!ds_map_empty(open)){
  crnt = ds_map_find_first(open);
  m_add(closed,crnt,0);
  ds_map_delete(open,crnt);
  adjacent[0] = instance_position(crnt.x+cell_w/2+cell_w/2,crnt.y+cell_h/2+cell_h/2,obj_terrain_parent);
  adjacent[1] = instance_position(crnt.x+cell_w/2+cell_w/2,crnt.y+cell_h/2-cell_h/2,obj_terrain_parent);
  adjacent[2] = instance_position(crnt.x+cell_w/2-cell_w/2,crnt.y+cell_h/2+cell_h/2,obj_terrain_parent);
  adjacent[3] = instance_position(crnt.x+cell_w/2-cell_w/2,crnt.y+cell_h/2-cell_h/2,obj_terrain_parent);
  for(i=0;i<4;i+=1){
    if(ds_map_exists(path,adjacent[i])&& !ds_map_exists(closed,adjacent[i])){
      if (edge_pathable(crnt,adjacent[i],max_diff)){
        m_add(open,adjacent[i],0);
      }else{
        output = false;
        break;
      }
    }
  }
  if(!output){break;} 
}
ds_map_destroy(open);
ds_map_destroy(closed);
ds_map_destroy(path);
return output;
