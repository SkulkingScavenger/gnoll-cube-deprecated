var target_size, loadfile, l;
//load character stats
if file_exists(working_directory + "profiles\" + argument0){
  loadfile = file_text_open_read(working_directory + "profiles\" + argument0)
  pname[crnt_pnum] = file_text_read_string(loadfile)//Character Name
  file_text_readln(loadfile);
  mu_class[crnt_pnum] = file_text_read_string(loadfile)//Class
  file_text_readln(loadfile);
  mu_spr[crnt_pnum] = file_text_read_real(loadfile) //Sprite Index
  file_text_readln(loadfile);
  mu_icon[crnt_pnum] = file_text_read_real(loadfile)//Portriat Index
  file_text_readln(loadfile);
  mu_lvl[crnt_pnum] = file_text_read_real(loadfile) //Level
  file_text_readln(loadfile);
  mu_mhp[crnt_pnum] = file_text_read_real(loadfile) //Max HP
  file_text_readln(loadfile);
  mu_hp[crnt_pnum] = file_text_read_real(loadfile)  //Current HP
  file_text_readln(loadfile);
  mu_mep[crnt_pnum] = file_text_read_real(loadfile) //Max EP
  file_text_readln(loadfile);
  mu_ep[crnt_pnum] = file_text_read_real(loadfile)  //Current EP
  file_text_readln(loadfile);
  crnt_atk = file_text_read_real(loadfile)          //Attack Stat
  file_text_readln(loadfile);
  crnt_atkspd = file_text_read_real(loadfile)       //Attack Speed Stat
  file_text_readln(loadfile);
  crnt_rng = file_text_read_real(loadfile)          //Attack Range Stat
  file_text_readln(loadfile);
  crnt_def = file_text_read_real(loadfile)          //Defense Stat
  file_text_readln(loadfile);
  crnt_spd = file_text_read_real(loadfile)          //Movement Speed Stat
  file_text_readln(loadfile);
  gold = file_text_read_real(loadfile)              //Gold
  file_text_readln(loadfile);
  lexp = file_text_read_real(loadfile)              //Level Experience
  file_text_readln(loadfile);
  sklpts = file_text_read_real(loadfile)            //Skill Points
  file_text_readln(loadfile);
  //file_text_write_real(savefile,traitpts)
  //file_text_write_real(savefile,attribute pts)
  //file_text_write_real(savefile,weapon tech)
  
  //Traits
  for(i=0;i<12;i+=1){
    trait[i] = file_text_read_real(loadfile)
    file_text_readln(loadfile);
  }
  //Skills
  l = ds_list_size(skill_list);
  for(i=0;i<l;i+=1){
    skl_lvl[i] = file_text_read_real(loadfile)
    file_text_readln(loadfile);
  }
  //Abilities
  l = ds_list_size(ability_list);
  for(i=0;i<l;i+=1){
    abl_lvl[i] = file_text_read_real(loadfile)
    file_text_readln(loadfile);
  }
  //Ability Slots
  for(i=0;i<8;i+=1){
    abl_slot[i] = file_text_read_real(loadfile)
    file_text_readln(loadfile);
  }
  
  //Equipment
  crnt_wpn = file_text_read_real(loadfile)
  file_text_readln(loadfile);
  //mu_armr[crnt_pnum] = file_text_read_real(loadfile) //Load Armor
  //file_text_readln(loadfile);


  /*
  //poison variables
  file_text_write_real(savefile,psnstr)
  file_text_write_real(savefile,psndc)
  file_text_write_real(savefile,psndur)
  file_text_write_real(savefile,psnrem)
  //local variables
  file_text_write_real(savefile,main_unit.x)
  file_text_write_real(savefile,main_unit.y)
  file_text_write_real(savefile,mmdir)
  crnt_room = file_text_read_string(loadfile)
  //debuff & buff variables
  file_text_write_real(savefile,dbstr)
  */
  
  /*
  //derivative skill variables
  
  
  */
  
  //Inventory
  // clear inventory lists
  for(i=0;i<6;i+=1)
      {
      ds_list_clear(inv_list[i])
      }
  
  // load inventory
 for(i=0;i<6;i+=1)
     {
      target_size = file_text_read_real(loadfile);
      file_text_readln(loadfile);
      for(j=0;j<target_size;j+=1)
          {
          ds_list_add(inv_list[i],file_text_read_real(loadfile));
          file_text_readln(loadfile);
          }
      }
  
  //load number of item stacks for treasure & useable
  for(i=0;i<2;i+=1)
      {
      target_size = file_text_read_real(loadfile);
      file_text_readln(loadfile);
      for(j=0;j<target_size;j+=1)
          {
          ds_list_add(inv_stacks[i],file_text_read_real(loadfile));
          file_text_readln(loadfile);
          }
      }
      
  //load story data
  //ds_list_clear(cinematics);
  target_size = file_text_read_real(loadfile);
  file_text_readln(loadfile);
  //TEMPORARY
  target_size = ds_list_size(cinematics);
  ds_list_clear(cinematics);
  //TEMPORARY
  for(i=0;i<target_size;i+=1)
      {
      ds_list_add(cinematics,file_text_read_real(loadfile))
      file_text_readln(loadfile);
      }
  
  file_text_close(loadfile)
  derive_load_variables()
  //return success
  output = 1;
}else{
  output = 0;//return failure
}
return output
