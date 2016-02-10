//check if old enemies are no longer remembered
var s, enemies,flag;
s = ds_list_size(enemy_list)
for(i=s-1;i>=0;i+=1){
  obj = l_get(enemy_list,i);
  if(!has_los(obj) && obj != target_enemy){
    l_del(enemy_list,i);
  }
}
