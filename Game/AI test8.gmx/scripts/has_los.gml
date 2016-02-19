var obj,xpos,ypos,zpos,output,tolerance,x_dist,y_dist,dir,target,divisible_by_two,top,left;

obj = argument0;
xpos = obj.x;
ypos = obj.y;
zpos = z;
tolerance = z_tolerance;

x_dist = ceil(abs(x-xpos)/cell_w)+2;//positive if x > xpos (if east of obj)
y_dist = ceil(abs(y-ypos)/cell_h)+2;//positive if y > ypos (if south of obj)
top = min(obj.y,y)-cell_h/2;
left = min(obj.x,x)-cell_w/2;
target = instance_place(top,left,obj_terrain_parent);
for(i=0;i<y_dist;i+=1){
  divisible_by_two = i mod 2;
  for(j=0;j<x_dist;j+=1){
    target = instance_position(left+j*cell_w+divisible_by_two*(cell_w/2),top+i*cell_h/2,obj_terrain_parent);
    with (target){
      if(collision_line(x,y,xpos,ypos,target,true,false)){
        if(target.z-tolerance > zpos){
          return false;
        }else{
          if(place_meeting(x,y,obj_doodad_parent)){
            if(instance_place(x,y,obj_doodad_parent).blocks_los){
              return false;
            }
          }
        }
      }
    }
  }
}
output = true;
return output;

/*

