var crnt,neighbor,path,old_g,old_f,f_score,temp_list,destination;
crnt = argument0;
neighbor = argument1;
open = argument2;
f_score = argument3;
destination = argument4;
old_g = neighbor.g;//get current f_score
old_f = neighbor.f;
theta_compute_cost(crnt,neighbor);
if (neighbor.g < old_g){
  if(old_f != noone){//if this node has not been assigned an f_score
    temp_list = m_get(f_score,old_f);//get that darn index
    b_del(f_score,old_f,ds_list_find_index(temp_list,neighbor));//delete neighbor from bucket
  }
  //replace its value in Open Set
  ds_map_replace(open,neighbor,neighbor.g);
  neighbor.f = neighbor.g + node_distance(neighbor,destination);
  b_add(f_score,neighbor.g + node_distance(neighbor,destination),neighbor);
}
