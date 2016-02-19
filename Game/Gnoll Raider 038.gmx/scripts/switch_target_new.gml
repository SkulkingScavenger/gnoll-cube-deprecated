///Switch Target
//sets target_enemy to new target, sets target_enemy to noone if no new targets can be found
var s,obj;
target_enemy = noone;
s = ds_list_size(enemy_list);
for(i=0;i<s;i+=1){
  obj = l_get(enemy_list,i);
  if(target_enemy == noone){
    target_enemy = obj;
  }else{
    if(calculate_aggro(obj)>calculate_aggro(output)){
      target_enemy = obj;
    }
  }
}
