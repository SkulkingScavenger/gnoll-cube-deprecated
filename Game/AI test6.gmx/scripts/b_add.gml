///bucket add
var bucket,temp_list,key,value;
bucket = argument0;
key = argument1;
value = argument2;
if(ds_map_exists(bucket,key)){
  temp_list = m_get(bucket,key);
  l_add(temp_list,value);
}else{
  temp_list = ds_list_create();
  m_add(bucket,key,temp_list);
  l_add(temp_list,value);
}
