var len, dir, xpos, ypos, zpos, s, output;
len = argument0;
dir = argument1;
diff = argument2;
output = true;
xpos = x;
ypos = y;
zpos = z;
s = ceil((len*2)/cell_h);
for(i=0;i<s;i+=1){
  if(len >= cell_h/2){
    xpos += lengthdir_x(cell_h/2,dir);
    ypos += lengthdir_y(cell_h/2,dir);
    len -= cell_h;
  }else{
    xpos += lengthdir_x(len,dir);
    ypos += lengthdir_y(len,dir);
  }
  output = point_pathable(xpos,ypos,diff);
  if (!output){break;}
}
return output;
