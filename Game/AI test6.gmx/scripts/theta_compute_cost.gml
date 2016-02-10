var crnt, neighbor, parent;
crnt = argument0;
neighbor = argument1;
parent = crnt.previous;
if(parent != noone){
  if(line_pathable(parent.x,parent.y,neighbor.x,neighbor.y,ceil(w/cell_w)) && parent != noone){
    if(parent.g + node_distance(parent,neighbor) < neighbor.g){
      neighbor.previous = parent;
      neighbor.g = parent.g + node_distance(parent,neighbor);
      exit;
    }
  }
}
if crnt.g + node_distance(crnt,neighbor) < neighbor.g{
  neighbor.previous = crnt;
  neighbor.g = crnt.g + node_distance(crnt,neighbor);
}
