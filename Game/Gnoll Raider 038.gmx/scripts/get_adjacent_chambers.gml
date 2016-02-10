//argument0 = stack
//argument1 = crnt_wall
/*
current index = (i)div(w)+(i)mod(w)

west =      i-1 exists  && (i)mod(w)!=0
east =     i+1 exists  && (i)mod(w)<(w-1)
north =       i-w exists  && (i)div(w)>0
south =    i+w exists  && (i)div(w)<(h-1)

w=5, h=3, i =
0   1   2   3   4
5   6   7   8   9
10  11  12  13  14

i div w = row#
i mod w = column#

*/
var i,w,h,lastcreated;
i = argument1;
w = argument2;
h = argument3;

//east
if ((i)mod(w)!=(w-1)){//if not on the east border
   lastcreated = ds_list_find_value(chamber_list,(i+1));//load the cell to the east
   if (!lastcreated.visited){//if that cell is a place_holder
        ds_list_add(argument0,lastcreated);//add it to the list
        lastcreated.previous = argument1;//set the previous to i
    }
}
//west
if ((i)mod(w)!=0){
   lastcreated = ds_list_find_value(chamber_list,(i-1));
   if (!lastcreated.visited){
        ds_list_add(argument0,lastcreated);
        lastcreated.previous = argument1;
    }
}
//south
if ((i)div(w)!=(h-1)){
   lastcreated = ds_list_find_value(chamber_list,(i+w));
   if (!lastcreated.visited){
        ds_list_add(argument0,lastcreated);
        lastcreated.previous = argument1;
    }
}
//north
if ((i)div(w)!=0){
   lastcreated = ds_list_find_value(chamber_list,(i-w));
   if (!lastcreated.visited){
        ds_list_add(argument0,lastcreated);
        lastcreated.previous = argument1;
    }
}
