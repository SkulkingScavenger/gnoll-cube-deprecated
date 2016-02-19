var obj,output;
obj = argument0;
output = false;
if(degree_difference(point_direction(x,y,obj.x,obj.y),dir_face) <= 90){//if in range of peripherals
  if(degree_difference(point_direction(x,y,obj.x,obj.y),dir_face) <= 30){
    peripheral_radius = vision_radius;
  }else{
    peripheral_radius = vision_radius/2;
  }
  if(target_in_range(obj,peripheral_radius)){
    if(has_los(obj)){
      if(is_illuminated(obj)){
        output = true;
      }
    }
  }
}
return output;
