/*
argument0 = target list
argument1 = value to search for
returns the list of indices at which instances of (value) can be found in the original list
*/
var output;

output = ds_list_create();
for(i=0;i<ds_list_size(argument0);i+=1)
    {
    if (ds_list_find_value(argument0,i) == argument1)
        {
        ds_list_add(output,i);
        }
    }

return output;
