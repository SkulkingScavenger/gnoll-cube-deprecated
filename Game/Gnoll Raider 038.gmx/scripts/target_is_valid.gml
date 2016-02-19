var output,target;
target = argument0;
output = true;

  //check if target is still valid
  if (target.hitpoints <= 0){
    output = false;
  }else if (point_distance(x,y,target.x,target.y) > pursuit_range){
    output = false; //too far to chase
  }else if (!path_to_target_exists(target)){
    output = false; //if the path can't be found or is too long, give up. (can't imagine when this would happen though)
  }

return output;
