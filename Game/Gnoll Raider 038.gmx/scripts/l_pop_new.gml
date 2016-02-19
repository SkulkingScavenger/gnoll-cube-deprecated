var l,list,output;
list = argument0;
l = ds_list_size(list);
output = ds_list_find_value(list,l-1);
ds_list_delete(list,l-1);
return output;
