///Get Direction of speed
/*
argument0 = yspd
argument1 = xspd

        xspd -  xspd 0  xspd +
yspd -  NW      NN      NE
yspd 0  WW      N/A     EE
yspd +  SW      SS      SE
*/
var xspd, yspd, crnt_dir;
xspd = argument0;
yspd = argument1;
crnt_dir = argument2;

if (xspd != 0){
  if (xspd > 0){ //x+
    if(yspd > 0){
      crnt_dir = 315;//SE
    }else if(yspd < 0){
      crnt_dir = 45;//NE
    }else{
      crnt_dir = 0;//EE
    }
  }else{ //x-
    if(yspd > 0){
      crnt_dir = 225;//SW
    }else if(yspd < 0){
      crnt_dir = 135;//NW
    }else{
      crnt_dir = 180;//WW
    }
  }
}else if (yspd !=0){//x0
  if (yspd > 0){
    crnt_dir = 270;//SS
  }else{
    crnt_dir = 90;//NN
  }
}
return crnt_dir;
