#define l_del
ds_list_delete(argument0,argument1);

#define l_get
ds_list_find_value(argument0,argument1);

#define m_get
ds_map_find_value(argument0,argument1);

#define l_pop
var l,list,output;
list = argument0;
l = ds_list_size(list);
output = ds_list_find_value(list,l-1);
ds_list_delete(list,l-1);
return output;

#define l_add
ds_list_add(argument0,argument1);

#define m_add
ds_map_add(argument0,argument1,argument2);

#define b_add
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

#define b_del
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

#define b_get
///bucket get at index under key
var bucket,temp_list,key,index;
bucket = argument0;
key = argument1;
index = argument2;

temp_list = m_get(bucket,key);//get the list under the key
return l_get(temp_list,index);//return the item in that list at index

#define bucket_destroy
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

#define dcos
return cos(degtorad(argument0));

#define dtan
return tan(degtorad(argument0));

#define dsin
return sin(degtorad(argument0));

#define darccos
return radtodeg(arccos(argument0));

#define darcsin
return radtodeg(arcsin(argument0));

#define darctan
return radtodeg(arctan(argument0));

#define darctan2
return radtodeg(arctan2(argument0,argument1));

#define l_clear
ds_list_clear(argument0);

#define s_pop
return ds_stack_pop(argument0);

#define s_push
ds_stack_push(argument0,argument1);

