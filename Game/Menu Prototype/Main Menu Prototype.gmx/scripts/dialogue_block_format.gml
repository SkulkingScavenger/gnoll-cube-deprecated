//Custom string method: breaks a piece of a certain size off of longer starting string  
//argument0 = string
//argument1 = max width

target_width = argument1;
//get @ operators. if they do not occur at the end of a line, add 2 to target_width
i = 0;
counter = 0;
while (i <= target_width) // while the number of non-@# subs is not greater than max_w
    {
    if (string_char_at(argument0,counter) != '@')
        {
        i+=1;
        counter +=1;
        }
    else
        {
        counter +=2;
        }
    //if (counter > string_length(argument0)){break;} //if counter has reached the end
    }
target_width = counter;
str = string_copy(argument0,0,target_width);//str = substring of arg0 beginning at index 0 and ending at line cutoff
//check to see if the substring has any natural breaking points
no_spaces = true;
for (i=string_length(str); i>=0; i-=1)
    {
    if (string_char_at(str,i) == ' ' ||  string_char_at(str,i) == '-')
        {
        no_spaces = false;
        proper_length = i;
        break;
        }
    }
if (no_spaces)
    {
    output = str;
    }
else
    {
    output = string_copy(str,0,proper_length);
    }
return output

/*  i = 0
    while i < proper_length
        {
        if i == string_length(str){break;}
        if str[i] = '@'
            {}
        else
            {
            i+=1;
            }
        counter += 1;
        }
    return counter //counter is the position/size to cut the block off at
    
    string = "aa@1aaa@2aaaaa@a@1@1aaaa"
    string = "@1@1@1@1@1@1@1@1@1"
    string = ""
    
    run through the original textblock and find the sentence one would get, ignoring
    @ formatters.
    then run through the resulting textfragment. for each @ operator, add 
    2 to proper_length
    take off a new chunk according to the new size.
    test to see if any new @ operators have occurred.
    OR
    run through the textblock and until one finds the number of non-@# substrings 
    in the proper length or until one gets to the last fragment
    return the position of the last 

