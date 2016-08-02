///Slave Receive


while (true)
    {
    var packet;
    
    packet = readbyte();//read packet header
    // Use the packet id to decide how to handle the message
    // inside a switch statement
    switch packet
        {
        // A connection has been closed with a client
        case SLAVE_DROP:
            sid = readbyte()
            show_message_menu("Player " +string(pslot[sid])+ " has disconnected");
            i = sid   //sid is the pnum of dropped slave
            while i < cjp   //for instance, less than 5, [IDs 0-4]
                {
                if sid != cjp-1 
                //this way if pnum[4] drops,(5-1=4)it can skip the dropdown step
                    {
                    pnum[i] = pnum[i+1] //player ID 2 drops, ID2 = ID3, ID3 = ID 4 etc.
                    pname[i] = pname[i+1]
                    //psocket[i] = psocket[i+1]
                    //ptext[i] = ptext[i+1]
                    pslot[i] = pslot[i+1]
                    }
                else
                    {
                    pname[i] = ''
                    socket[i] = 0
                    ptext[i] = ''
                    }
                i += 1;  
                }
            cjp -= 1
            break;
            
        // update text and position. maybe set something up in case of conflicts
        case MU_MOVE:
          sid = readbyte();
          if sid != crnt_pnum
            {
            mx[sid] = readint();      //read multiplayer x
            my[sid] = readint();      //read multiplayer y
            mz[sid] = readint();      //read multiplayer z
            mxspd[sid] = readint();   //read multiplayer x speed
            myspd[sid] = readint();   //read multiplayer y speed 
            mzspd[sid] = readint();   //read multiplayer z speed
            mfdir[sid] = readshort(); //read multiplayer face direction
            mmdir[sid] = readshort(); //read multiplayer move direction
            pchar[sid].x = mx[sid];   //set multiplayer x
            pchar[sid].y = my[sid];   //set multiplayer y
            pchar[sid].z = mz[sid];   //set multiplayer z
            pchar[sid].xspd = mxspd[sid];     //set multiplayer x speed
            pchar[sid].yspd = myspd[sid];     //set multiplayer y speed
            pchar[sid].zspd = mzspd[sid];     //set multiplayer z speed
            pchar[sid].dir_face = mfdir[sid]; //set multiplayer face direction
            pchar[sid].dir_move = mmdir[sid]; //set multiplayer move direction
            }
          break;
            
        // this is complicated: you need to create objects 2 steps ahead to make up for lost time
        case MU_ATK:
            sid = readbyte();
            matkobj = readint();
            matkx = readint();
            matky = readint();
            //matkspd[sid] = readint();
            mfdir[sid] = readint();
            mrng = readint();
            mdmg = readint();
            //create a projectile object with the stats in place
            //check if its our own weapon?
            if sid != crnt_pnum
                {
                lastcreated = instance_create(matkx,matky,matkobj);
                lastcreated.controlling_player = sid;
                lastcreated.dir = mfdir[sid];
                with(lastcreated){event_user(0);}
                lastcreated.alarm[0] = (mrng*16 div lastcreated.spd);
                lastcreated.dmg = mdmg;
                lastcreated.slavecreated = true;
                //possibility: make up for being a full step behind
                with lastcreated
                    {
                    if place_free(x,y) && !place_meeting(x,y,obj_enemy_parent)
                        {
                        x += hspeed
                        y += vspeed
                        }
                    }
                }
            break;
            
        // update everything to make sure nothings messed up
        case MU_STEP:
            sid = readbyte();
            if (sid != crnt_pnum){
              mu_hp[sid] = readint();
              mu_ep[sid] = readint();
              mx[sid] = readint();
              my[sid] = readint();
              mxspd[sid] = readint();
              myspd[sid] = readint();
              msneaking[sid] = readbyte();
              mdodge[sid] = readbyte();
              //mbuffs[sid] = readint();
              //mexp[sid] = readint();
              if (msneaking[sid]){
                pchar[sid].sneaking = true;
                pchar[sid].image_alpha = 0.5;
              }else{
                pchar[sid].sneaking = false;
                pchar[sid].image_alpha = 1;
              }
            }
            break;
            
            // dead
        case MU_DEAD:
            sid = readbyte(); 
            if sid != crnt_pnum
                {
                mu_hp[sid] = readint();
                if mu_hp[sid] <= 0
                    {
                    with pchar[sid]
                        {
                        instance_destroy()
                        }    
                    }
                mu_ep[sid] = readint();
                mx[sid] = readint();
                my[sid] = readint();
                mxspd[sid] = readint();
                myspd[sid] = readint();
                //mbuffs[sid] = readint();
                //mexp[sid] = readint();
                mu_graveroom[sid] = room_id;
                mu_gravex[sid] = mx[sid];
                mu_gravey[sid] = my[sid];
                }
            break;
            
        case MU_MAG:
            main_unit_magic_slave(); 
            break;
            
        case MU_GET:
            if readbyte() == 1
                {
                crnt_npcid = readint();
                crnt_obj = readint();
                crnt_x = readint();
                crnt_y = readint();
                target = npcid_array[crnt_npcid];
                if !object_is_ancestor(target.object_index,obj_coin_parent)
                    {
                    ds_list_add(target.invlistid,target.itemid);
                    getting = false;
                    }
                else
                    {
                    with target
                        {
                        gold += value;
                        }
                    }
                }
            else
                {
                getting = false;
                }
            
        case NEXT_ROOM:
            mp_next_room();
            break;
            
        case NPC_CREATE:
            npc_createx = readint();
            npc_createy = readint();
            npc_createobj = readint();
            crnt_npcid = readint();
            if crnt_npcid >= npcid_index //And thus ends the curse of the double enemies. What was the cause of this mysterious glitch? We may never know, but its over now. But woe unto whosoever should seek to clear memory by defragmenting the npcid_list in the middle of a room!
            {
            lastcreated = instance_create(npc_createx,npc_createy,npc_createobj)
            lastcreated.npcid = crnt_npcid;
            npcid_array[lastcreated.npcid] = lastcreated;
            npcid_index += 1
            with npc_createobj
                {
                if (npcid == 0){instance_destroy();}
                }
            }
            break;
            
        case NPC_DEAD:
            npc_dead();
            break;

        case NPC_DMG:
            sid = readbyte();
            crnt_npcid = readint();
            dmg_sustained = readint();
            dmg_direction = readint();
            with npcid_array[crnt_npcid]
                {
                dmg_sustained = obj_slavecontrol.dmg_sustained;
                dmg_direction = obj_slavecontrol.dmg_direction;
                npc_damage()
                }
            break;
            
        case MU_FX:
            sid = readbyte();
            tar_x = readint();
            tar_y = readint();
            crnt_obj = readint();
            crnt_dur = readint();
            lastcreated = instance_create(tar_x,tar_y,crnt_obj);
            lastcreated.alarm[0] = crnt_dur;
            break;
            
        case GAME_OVER:
            if (room_id != 11)
                {
                global.startx = 944;
                global.starty = 304;
                gold = 0;
                room_goto(room_gameover);
                }
            break;        
            
        case NPC_STEP:
            crnt_npc = readint();
            crnt_npc = npcid_array[crnt_npc];
            crnt_npc.x = readint();
            crnt_npc.y = readint();
            crnt_npc.xspd = readint();
            crnt_npc.yspd = readint();
            crnt_npc.hitpoints = readint();
            crnt_npc.behavior = readint();
            break;
            
        case MU_SAVE:
            save_game(pname);
            lastcreated = instance_create(x,y,obj_fltext_global);
            lastcreated.text = ("Game has been saved.");
            lastcreated.color = c_green;
            break;
            
        case NEXT_CHAMBER:
          mp_next_chamber();
          break;
          
        case SEED:
          dungeon_seed = readint();
          dungeon_type = readint();
          //Build Potential Dungeon
          if instance_exists(crnt_dungeon){
            with crnt_dungeon{instance_destroy();}
          }
          crnt_dungeon = instance_create(0,0,dungeon_type);
        }   
    }     

    
    /* these are for enemies
        case NPC_ATK:
            break;
        
        case NPC_MOVE:
            break;
            

        
        case NPC_MAG:
            break
        
