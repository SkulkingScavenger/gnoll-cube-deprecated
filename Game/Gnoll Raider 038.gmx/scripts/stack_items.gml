/*
argument0 = the list to be traversed
argument1 = the target item type
argument2 = target item category
*/
/*
var total_items,total_max,total_space,total_stacks,stack_indices,output,stack;

if (ds_list_find_index(argument0,argument1) > 0)
    {
    stack_indices = ds_list_find_instances(argument0,argument1);
    total_items = ds_list_size(stack_indices);
    total_max = total_items*item_maxstacks[argument2,argument1];
    total_stacks = 0;
    for(i=0;i<ds_list_size(stack_indices);i+=1)
        {
        total_stacks+=ds_list_find_value(inv_stacks[argument2],ds_list_find_value(stack_indices,i));
        stack[i] = ds_list_find_value(inv_stacks[argument2],ds_list_find_value(stack_indices,i));
        }
    total_space = total_max - total_stacks;
    //if stacks are not already compiled
    if (total_stacks < total_max)
        {
        if (total_stacks < item_maxstacks[argument2,argument1])
            {
            for(i=0;i<total_items;i+=1)
                {
                
                }
            }
        }
    }
else 
    {
    output = -1;
    }
    
return output;
