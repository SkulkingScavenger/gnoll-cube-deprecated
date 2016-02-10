//reset global cooldowns
var l;
l = ds_list_size(ability_list);
for(i=0;i<l;i+=1){
  abl_ready[i] = true;
}

//Scavenge
scavenge_delay = 30;//channeling period
scavenge_energy = 2;//energy regen
scavenge_health = 0;//whether hp are gained (default = false)
//Sprint
sprint_ready = true;
sprint_duration = 240;//duration of sprint
sprint_cd = (30*30);//cooldown(starts after sprint is over)
sprint_mod = 2;//speed increase
//Ambush
sneak_ready = true;
sneak_delay = 1*room_speed;//delay (channeling)
sneak_cd = 4*room_speed;//cooldown (starts after stealth is over)
sneak_level = 1;//REMOVE THIS ONCE YOU HAVE WAYS OF INCREASING SNEAK LEVEL THAT SHOULD BE LOADED
sneak_duration = 8*room_speed;//max duration of stealth
sneak_mod = 0.5;//speed penalty factor while sneaking

//story stuff
    //rank
    //chapter
    //keys
    //ds_list_dialog
//inventory

