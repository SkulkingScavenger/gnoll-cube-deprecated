///bucket get at index under key
var bucket,temp_list,key,index;
bucket = argument0;
key = argument1;
index = argument2;

temp_list = m_get(bucket,key);//get the list under the key
return l_get(temp_list,index);//return the item in that list at index
