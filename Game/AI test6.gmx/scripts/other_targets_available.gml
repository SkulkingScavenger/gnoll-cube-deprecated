var output,target,l;
output = false;
l = ds_list_size(enemy_list);

for(i=0;i<l;i+=1){
  target = ds_list_find_value(enemy_list,i){
    if target_is_valid(target){
      output = true;
      break;
    }
  }
}

return output;
