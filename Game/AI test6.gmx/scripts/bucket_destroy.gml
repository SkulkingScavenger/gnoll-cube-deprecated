var bucket,key,temp_list,l;
bucket = argument0;
if(!ds_map_empty(bucket)){
  key = ds_map_find_first(bucket);
  temp_list = ds_map_find_value(bucket,key);
  ds_list_destroy(temp_list);
  l = ds_map_size(bucket);
  for(i=0;i<l-1;i+=1){
    key = ds_map_find_next(bucket,key);
    temp_list = ds_map_find_value(bucket,key);
    ds_list_destroy(temp_list);
  }
}
ds_map_destroy(bucket);
