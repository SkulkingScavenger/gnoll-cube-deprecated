var xpos, ypos, ground, output, p, c;
xpos = argument0;
ypos = argument1;
ground = argument2;
switch(ground.ascent_direction){
case 1:
  c = get_iso_45d(xpos,ypos);//center line of character isometric latitude
  if (c > ground.b){
    output = ground.z+ground.d;
  }else if(c < ground.a){
    output = ground.z;
  }else{
    p = (ground.iso_h-(ground.b-c));
    output = ground.z+p*ground.slope//p*(ground.h-ground.z);
  }
  break;
case 2:
  c = get_iso_135d(xpos+cell_w/2,ypos+cell_h/2);//center line of character isometric latitude
  debug = c;
  if (c > ground.b){
    output = ground.z+ground.d;
  }else if(c < ground.a){
    output = ground.z;
  }else{
    p = (ground.iso_h-(ground.b-c));
    
    output = ground.z+p*ground.slope//p*(ground.h-ground.z);
    ground.debug = p;
  }
  break;
case 3:
  c = get_iso_45d(xpos,ypos);//center line of character isometric latitude
  if (c > ground.b){
    output = ground.z+ground.d;
  }else if(c < ground.a){
    output = ground.z;
  }else{
    p = (ground.iso_h-(ground.b-c));
    output = ground.z+p*ground.slope//p*(ground.h-ground.z);
  }
  break;
case 4:
  c = get_iso_135d(xpos,ypos);//center line of character isometric latitude
  if (c < ground.b){
    output = ground.z+ground.d;
  }else if(c > ground.a){
    output = ground.z;
  }else{
    p = (ground.iso_h-(ground.b-c));
    output = ground.z+p*ground.slope//p*(ground.h-ground.z);
  }
  break;
}

return output;
