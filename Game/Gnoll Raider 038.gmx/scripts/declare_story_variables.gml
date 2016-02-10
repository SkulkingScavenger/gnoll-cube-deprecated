globalvar cinematics,reset_order;

cinematics = ds_list_create();//boolean list, states whether the given cinematic has been played
reset_order = 0;//if true, reset room

//fill cinematics list with zeros
for(i=0;i<4;i+=1)
    {
    ds_list_add(cinematics,0);
    }

