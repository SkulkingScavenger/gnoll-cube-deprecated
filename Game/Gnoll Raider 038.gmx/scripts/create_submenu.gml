var xpos,ypos,w,h,btn_sprite,selection_sprite,btn_w,btn_h,btn_x,btn_y,scrolling;
xpos = argument[0];
ypos = argument[1];
w = argument[2];
h = argument[3];
output = instance_create(xpos,ypos,obj_submenu);
output.w = w;
output.h = h;
if (argument_count > 4){
  output.btn_sprite = argument[4];
}else{
  output.btn_sprite = spr_btn_96x32;
}
if (argument_count > 5){
  output.border_sprite = argument[5];
}else{
  output.border_sprite = spr_selection_96x32;
}
if (argument_count > 7){
  output.btn_w = argument[6];
  output.btn_h = argument[7];
}else{
  output.btn_w = 48;
  output.btn_h = 32;
}
if (argument_count > 9){
  output.btn_x = argument[8];
  output.btn_y = argument[9];
}else{
  output.btn_x = 0;
  output.btn_y = 0;
}
output.scroll_enabled = false;
if(argument_count > 10){
  output.scroll_enabled = argument[10];
}
output.root = id;
with (output){
  event_user(0);
}
return output;

