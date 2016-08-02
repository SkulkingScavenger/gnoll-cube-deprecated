var obj,output;
obj = argument0;
output = false;
if(degree_difference(point_direction(x,y,obj.x,obj.y),dir_face) <= 30){
  if(target_in_range(obj,vision_radius)){
    if(has_los(obj)){
      if(is_illuminated(obj)){
        output = true;
      }
    }
  }
}
return output;
