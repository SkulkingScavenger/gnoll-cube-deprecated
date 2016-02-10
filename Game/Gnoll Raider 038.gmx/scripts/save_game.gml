var l;
if (!directory_exists("profiles")){
  directory_create("profiles");
}
if file_exists(working_directory + "profiles\" + string(argument0) + ".txt"){
  file_delete(working_directory + "profiles\" + string(argument0) + ".txt")
}
write_header(argument0);
//save character stats
savefile = file_text_open_write(working_directory + "profiles\" + string(argument0) + ".txt");
file_text_write_string(savefile,pname[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_string(savefile,mu_class[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_spr[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_icon[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_lvl[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_mhp[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_hp[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_mep[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,mu_ep[crnt_pnum]);
file_text_writeln(savefile);
file_text_write_real(savefile,crnt_atk);
file_text_writeln(savefile);
file_text_write_real(savefile,crnt_atkspd);
file_text_writeln(savefile);
file_text_write_real(savefile,crnt_rng);
file_text_writeln(savefile);
file_text_write_real(savefile,crnt_def);
file_text_writeln(savefile);
file_text_write_real(savefile,crnt_spd);
file_text_writeln(savefile);
file_text_write_real(savefile,gold);
file_text_writeln(savefile);
file_text_write_real(savefile,lexp);
file_text_writeln(savefile);
file_text_write_real(savefile,sklpts);
file_text_writeln(savefile);
//file_text_write_real(savefile,traitpts)
//file_text_write_real(savefile,attribute pts)
//file_text_write_real(savefile,weapon tech)

//file_text_write_real(savefile,quality) //Save Quality
//file_text_writeln(savefile);

//Traits
for(i=0;i<12;i+=1){
  file_text_write_real(savefile,trait[i])
  file_text_writeln(savefile);
}
//Skills
l = ds_list_size(skill_list);
for(i=0;i<l;i+=1){
  file_text_write_real(savefile,skl_lvl[i]);
  file_text_writeln(savefile);
}
//Abilities
l = ds_list_size(ability_list);
for(i=0;i<l;i+=1){
  file_text_write_real(savefile,abl_lvl[i]);
  file_text_writeln(savefile);
}
//Ability Slot Settings
for(i=0;i<8;i+=1){
  file_text_write_real(savefile,abl_slot[i])
  file_text_writeln(savefile);
}
//Equipment
file_text_write_real(savefile,crnt_wpn)
file_text_writeln(savefile);
//file_text_write_real(savefile,mu_armr[crnt_pnum]) // Save Armor
//file_text_writeln(savefile);


/*
//poison variables
file_text_write_real(savefile,psnstr)
file_text_write_real(savefile,psndc)
file_text_write_real(savefile,psndur)
file_text_write_real(savefile,psnrem)
//local variables
file_text_write_real(savefile,main_unit.x)
file_text_write_real(savefile,main_unit.y)
file_text_write_real(savefile,mu_dir)
file_text_write_string(savefile,mu_room)
//debuff & buff variables
file_text_write_real(savefile,dbstr)
*/

/*
//derivative skill variables


*/


//Save Inventory
for(i=0;i<6;i+=1)
    {
    file_text_write_real(savefile,ds_list_size(inv_list[i]))
    file_text_writeln(savefile);
    for(j=0;j<ds_list_size(inv_list[i]);j+=1)
        {
        file_text_write_real(savefile,ds_list_find_value(inv_list[i],j))
        file_text_writeln(savefile);
        }
    }
//Save Item Stack Data
for(i=0;i<2;i+=1)
    {
    file_text_write_real(savefile,ds_list_size(inv_stacks[i]))
    file_text_writeln(savefile);
    for(j=0;j<ds_list_size(inv_stacks[i]);j+=1)
        {
        file_text_write_real(savefile,ds_list_find_value(inv_stacks[i],j));
        file_text_writeln(savefile);
        }
    }
    
/*
//inv_list_all
//inv_list_box
*/

//Save Story Data
file_text_write_real(savefile,ds_list_size(cinematics));
file_text_writeln(savefile);
for (i=0;i<ds_list_size(cinematics);i+=1){
  file_text_write_real(savefile,ds_list_find_value(cinematics,i));
  file_text_writeln(savefile);
}
file_text_close(savefile)

