#define dialogue_block_format
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


#define dialogue_log_append
//argument0 = str to be appended to the log

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



#define count_formatted_lines
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


#define calculate_damage
//argument0 = damage taken
var dmg;
if (object_index = obj_gnoll){
  dmg = argument0-(crnt_def+defmod);
}else{
  dmg = argument0-(npcdef+npcdefmod)
}

//ensure that armor does not reduce damage below 1
if (dmg <= 1){
  dmg = 1;
}
return dmg;

#define npc_damage
    hitpoints -= dmg_sustained
    lastcreated = instance_create(x,y,obj_fltext_dmg)
    lastcreated.text = string(dmg_sustained)
    lastcreated.hspeed =irandom_range(-2,2)
    lastcreated.vspeed = -4
    //if other.poison == false
    lastcreated.dmgtype = 0

    if hitpoints <= 0 && global.master == true
        {
        //instance_change(obj_deadenemy,true)
        instance_destroy();
    
        }
    else // knockback
        {
        if place_free(x+lengthdir_x(4,dmg_direction),y+lengthdir_y(4,dmg_direction))
            && knockable == true
            {
            //KNOCKBACK IS STUPID
            //x += lengthdir_x(4,dmg_direction)
            //y += lengthdir_y(4,dmg_direction)
            }
        }

#define end_dialogue
//cleans up the dialogue
//argument0 = target_npc
//argument1 = dlg_menu

//reset variables
with argument0
    {
    conversing = false;
    talking = false;
    dlg_over = false;
    talk_i = 0;
    talk_j = 0;
    talk_char = '';
    }

with argument1
    {
    instance_destroy();
    }

#define ds_list_find_instances
/*
argument0 = id
argument1 = value
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

#define stack_items
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

#define shop_dlg_append

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

#define room_initialize
///create generic objects for all rooms
if (global.master){
  instance_create(x+16,y,obj_mastercontrol);
}else{
  with(obj_npc_parent){
    //IN TESTING
    id_found = false;
    for(i=1;i<npcid_index;i+=1){
      if (npcid_array[i] == id){
        id_found = true;
        break;
      }
    }
    if (!id_found){
      instance_destroy();
    }
    //IN TESTING
    //instance_destroy()
  }
  instance_create(x+16,y,obj_slavecontrol);
}



#define lobby_pslot
var maxpos,minpos, spot_taken;

arg0 = 1
maxpos = 8
minpos = 1


i = (pslot[crnt_pnum] + arg0) // next slot down = pslot[2] i = 3
while i != pslot[crnt_pnum] // while i is not pslot[1]
    {
    j = 0
    spot_taken = false
    while j < cjp       // run through each player ID and check if any are using that slot
        {
        if pslot[j] == i // check if player 1 is at pslot[2] (3) ifpslot[0] == 3, he's there
            {               // if player 2 is at pslot[2] (3) ifpslot[1] == 3, he's there
            spot_taken = true; //we know that neither of these people is at pslot[2]
            break;
            }
        else
            {
            j += 1;
            }
        }
    if spot_taken == false //so move there.
        {
        return i
        exit;
        }
    else
        {
        if i != maxpos
            {
            i += arg0
            }
        else
            {
            i = minpos
            }
        }   
    }
return -1


#define speed_direction
///Get Direction of speed
/*
argument0 = yspd
argument1 = xspd

        xspd -  xspd 0  xspd +
yspd -  NW      NN      NE
yspd 0  WW      N/A     EE
yspd +  SW      SS      SE
*/
var xspd, yspd, crnt_dir;
xspd = argument0;
yspd = argument1;
crnt_dir = argument2;

if (xspd != 0){
  if (xspd > 0){ //x+
    if(yspd > 0){
      crnt_dir = 315;//SE
    }else if(yspd < 0){
      crnt_dir = 45;//NE
    }else{
      crnt_dir = 0;//EE
    }
  }else{ //x-
    if(yspd > 0){
      crnt_dir = 225;//SW
    }else if(yspd < 0){
      crnt_dir = 135;//NW
    }else{
      crnt_dir = 180;//WW
    }
  }
}else if (yspd !=0){//x0
  if (yspd > 0){
    crnt_dir = 270;//SS
  }else{
    crnt_dir = 90;//NN
  }
}
return crnt_dir;

#define arrowkey_direction
//takes no arguments
var crnt_dir;
if ((arrow_up) || (arrow_down)){
  crnt_dir = 180;
  if (arrow_up){
    crnt_dir -= 90;
    if (arrow_left){
      crnt_dir += 46;
    }
    if (arrow_right){
      crnt_dir -= 45;
    }
  }
  if (arrow_down){
    crnt_dir += 90;
    if (arrow_left){
      crnt_dir -= 45;
    }
    if (arrow_right){
      crnt_dir += 45;
    }
  }
  if (!pivot_btn){
    image_speed = 0.25;
  }
}else{
  if (arrow_left || arrow_right){
    crnt_dir = 180*arrow_left;
    if (!pivot_btn) {
      image_speed = 0.25;
    }
  }
}
return crnt_dir;

#define set_image
var crnt_image,crnt_dir;
crnt_image = argument0;
crnt_dir = argument1;


switch ((crnt_dir+22.5) div 45)
    {
    case 0:
        sprite_index = sprEE[crnt_image];
        break;
        
    case 1:
        sprite_index = sprNE[crnt_image];
        break;
        
    case 2:
        sprite_index = sprNN[crnt_image];
        break;
        
    case 3:
        sprite_index = sprNW[crnt_image];
        break;
        
    case 4:
        sprite_index = sprWW[crnt_image];
        break;
        
    case 5:
        sprite_index = sprSW[crnt_image];
        break;
        
    case 6:
        sprite_index = sprSS[crnt_image];
        break;
        
    case 7:
        sprite_index = sprSE[crnt_image];
        break;
        
    case 8:
        sprite_index = sprEE[crnt_image];
        break;
    }

#define projectile_start_position
var target, crnt_dir;
target = argument0;
crnt_dir = argument1;
switch((crnt_dir+22.5) div 45){
  case 0://East
    target.x += 48;
    target.y += 16;
    break;
  case 1://North East
    target.x += 32;
    target.y -= 0;
    break;
  case 2://North
    target.x += 16;
    target.y -= 16;
    break;
  case 3://North West
    target.x -= 0;
    target.y -= 0;
    break;
  case 4: //West
    target.x -= 16;
    target.y += 16;
    break;
  case 5://South West
    target.x -= 0;
    target.y += 32;
    break;
  case 6://South
    target.x += 16;
    target.y += 48;
    break;
  case 7://South East
    target.x += 32;
    target.y += 32;
    break;
}
/*
switch((crnt_dir+22.5) div 45){
  case 0://East
    target.x += 64;
    target.y += 32;
    break;
  case 1://North East
    target.x += 48;
    target.y -= 16;
    break;
  case 2://North
    target.x += 16;
    target.y -= 32;
    break;
  case 3://North West
    target.x -= 16;
    target.y -= 16;
    break;
  case 4: //West
    target.x -= 32;
    target.y += 16;
    break;
  case 5://South West
    target.x -= 16;
    target.y += 48;
    break;
  case 6://South
    target.x += 16;
    target.y += 64;
    break;
  case 7://South East
    target.x += 48;
    target.y += 48;
    break;
}



#define io_clear2
if(!io_control.cleared){
start_btn = false;
confirm_btn = false;
cancel_btn = false;

arrow_right = false;
arrow_up = false;
arrow_left = false;
arrow_down = false;

pivot_btn = false;
strafe_btn = false;
sprint_btn = false;
sneak_btn = false;

attack_btn = false;
jump_btn = false;
toggle_btn = false;
interact_btn = false;

abl_btn[0] = false;
abl_btn[1] = false;
abl_btn[2] = false;
abl_btn[3] = false;

item_btn[0] = false;
item_btn[1] = false;
item_btn[2] = false;
item_btn[3] = false;

io_control.cleared = true;
io_control.alarm[0] = 5;
}

#define start_game
instance_create(0,0,obj_control);
crnt_dungeon = instance_create(0,0,obj_dungeon_yahazeer);
room_goto(room_lair01);


#define character_spawn
var xpos, ypos, w, h;
xpos = argument0;
ypos = argument1;
w = 32;
h = 16;
for(i=0;i<cjp;i+=1){
  for(i=0;i<cjp;i+=1){
    pchar[i].x = xpos + (i mod 3)*(w) - (i div 3)*(w);
    pchar[i].y = ypos -29 + (i mod 3)*(h) + (i div 3)*(h);
  }
}

