/*
Scroll through enemies and check their total aggro score against the current target
in case of tie, stick with current target.
return the alternative target. if target is the same as current target, return noone
*/
var output,s,obj;
output = false;
s = ds_list_size(enemy_list);
for(i=0;i<s;i+=1){
  obj = l_get(enemy_list,i);
  if(obj != target_enemy){
    if(has_los(obj)){
      if(calculate_aggro(obj) > calculate_aggro(target_enemy)){
        output = true;
      }
    }
  }
}
return output;
