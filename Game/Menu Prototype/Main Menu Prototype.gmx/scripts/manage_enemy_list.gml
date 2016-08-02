//check if old enemies are no longer remembered
var s, enemies,flag,data;
s = ds_list_size(enemy_list)
for(i=s-1;i>=0;i+=1){
  obj = l_get(enemy_list,i);
  data = l_get(enemy_data,i);
  if(obj != target_enemy){
    if(!has_los(obj) && !sound_heard(obj)){
      if( data.out_of_sight_count > out_of_sight_duration){
        l_del(enemy_list,i);
        l_del(enemy_data,i);
        with(data){instance_destroy();}
      }else{
        data.out_of_sight_count += 1;
      }
    }else{
      data.out_of_sight_count = 0;
    }
  }
}

/*
s = player_count;
for(i=0;i<s;i+=1){
  obj = player[i];
  if(ds_list_find_index(enemy_list,obj) == -1){
    if(!has_los(obj) && !sound_heard(obj)){
      if( data.out_of_sight_count > out_of_sight_duration){
        l_del(enemy_list,i);
        l_del(enemy_data,i);
        with(data){instance_destroy();}
      }else{
        data.out_of_sight_count += 1;
      }
    }else{
      data.out_of_sight_count = 0;
    }
  }
}
