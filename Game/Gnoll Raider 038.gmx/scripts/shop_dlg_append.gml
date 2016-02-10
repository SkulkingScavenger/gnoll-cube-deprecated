
var output;

output = argument0;

for(i=0;i<string_length(output);i+=1)
    {
    if string_char_at(output,i) == '@'
        {
        string_delete(output,i,2);
        }
    }
return output;
