var node_a,node_b,output,flat,sloped;
node_a = argument0;
node_b = argument1;
max_diff = argument2;
output = false;
if (abs(node_a.z - node_b.z)<=max_diff){
  output = true;
}else if(node_a.sloped || node_b.sloped){
  //run a bunch of checks
  //we already know that the z's are unequal
  if(node_a.sloped && node_b.sloped){
    //if they are facing the same way and the gap in the z is less than the height
    //assumes the slopes have equal steepness
    if(node_a.slope == node_b.slope && abs((node_a.z)-(node_b.z)) < node_a.d){
      output = true;
    }
  }else{
    //do the tricky bit
    if(node_a.sloped){
      sloped = node_a;
      flat = node_b;
    }else{
      sloped = node_b;
      flat = node_a;
    }
    if (sloped.z > flat.z){
      //going down
      //but the bottom of the ramp should equal the z of the bottom tile, which we know isn't the case
      output = false;
    }else{
      //going up
      if (abs(flat.z - sloped.z+sloped.d)<=max_diff){
        output = true;
      }else{output = true;}//no idea whats going on
    }
  }
}
return output;

