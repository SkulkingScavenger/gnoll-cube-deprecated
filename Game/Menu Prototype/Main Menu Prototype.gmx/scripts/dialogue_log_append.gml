//argument0 = str to be appended to the log
var dialogue_lines, line_length;
dialogue_lines = ds_list_create();
linelength = (6*16*SV)div(4);// 96*SV
thegoods = argument0;//initialize the text block
while ((string_length(thegoods) - (string_count("@",thegoods)*2)) > linelength)//while the block is larger than line_length
    {
    theprize = dialogue_block_format(thegoods,linelength); //breaks off a line from the block
    thegoods = string_replace(thegoods,theprize,""); //subtracts the line from the block
    ds_list_add(dialogue_lines,theprize); //adds the line to the list
    }
ds_list_add(dialogue_lines,thegoods)//adds the last line left in the block
return dialogue_lines

/*
what happens if we say:
while (string_length(thegoods) - (string_count("@",thegoods)*2)) > linelength
instead of (string_length(thegoods) > linelength)?
then if the last line contains @ operators that would make it longer than
linelength, the whole last line will be sent, even though the @ operators make it 
larger than linelength. This is okay, because the @ operators will not appear in the
final display


