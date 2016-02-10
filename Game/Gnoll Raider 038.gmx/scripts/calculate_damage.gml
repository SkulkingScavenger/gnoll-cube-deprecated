//argument0 = damage taken
var dmg;
if (object_index = obj_gnoll){
  dmg = argument0-(crnt_def+defmod);
}else{
  dmg = argument0-(npcdef+npcdefmod)
}

//ensure that armor does not reduce damage below 1
if (dmg <= 1){
  dmg = 1;
}
return dmg;
