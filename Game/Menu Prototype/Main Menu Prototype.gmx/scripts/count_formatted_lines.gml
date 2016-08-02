//argument0 = string
//argument1 = box length (in pixels)

max_length = (argument1)div(4);
str = argument0;
out = 0;
while (string_length(str) > max_length) //while block is bigger than target size
    {
    str = string_replace(str,dialogue_block_format(str,max_length),"");//chop off line i
    out += 1; //+1 lines chopped
    }
    
if str != ""
    {
    out += 1; //add the rest of the block now that its just one line
    }
return out

