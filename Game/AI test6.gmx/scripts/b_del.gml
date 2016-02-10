///bucket delete
var bucket,temp_list,key,index;
bucket = argument0;
key = argument1;
index = argument2;

temp_list = m_get(bucket,key);
l_del(temp_list,index);
if(ds_list_empty(temp_list)){
  ds_list_destroy(temp_list);
   ds_map_delete(bucket,key);
}
