var amount,crnt_angle,target_angle,output;
amount = argument0;
crnt_angle = argument1;
target_angle = argument2;
output = 0;

if(degree_difference(crnt_angle,target_angle)>amount){
  if(degree_difference(crnt_angle+1,target_angle)<degree_difference(crnt_angle-1,target_angle)){
    output = target_angle + amount;
  }else{
    output = target_angle - amount;
  }
}else{
  output = target_angle;
}
return output;
