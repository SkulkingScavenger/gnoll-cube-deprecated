var obj, output;
obj = argument0;
output = false;
//sneakiness formula
if(obj.sneakiness >= detection){
  detection_radius = vision_radius*(detection/(2*obj.sneakiness));
}else{
  detection_radius = vision_radius*(1-(obj.sneakiness/2*detection));
}
//if has moved or landed from a jump
if(obj.x != obj.xprevious || obj.y != obj.yprevious || (obj.z == obj.base_z && obj.zprevious != obj.base_z)){
  output = target_in_range(obj,detection_radius);
}
return output;
