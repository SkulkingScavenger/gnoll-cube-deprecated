var output,target,s;
output = false;
s = ds_list_size(enemy_list);

for(i=0;i<s;i+=1){
  target = ds_list_find_value(enemy_list,i){
    if (target != target_enemy){
      if target_is_valid(target){
        output = true;
        break;
      }
    }
  }
}

return output;
