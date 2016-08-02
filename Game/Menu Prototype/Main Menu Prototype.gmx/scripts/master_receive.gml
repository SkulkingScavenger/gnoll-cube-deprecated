///Master Receive
/*
master iterates through and parses all packets in the buffer at the beginning of each step
*/
while (true){
  // Initialize local variables for storing the packet id, size, and slaveID
  var packet, sid;
  sid = -1;

  receive_buffer = ds_map_find_value(async_load, "buffer");

  //read the header of the packet
  packet = readbyte();

  // Use the packet id to decide how to handle the message
  // inside a switch statement
  switch packet{

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
                    socket[i] = socket[i+1]
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
            clearbuffer()
            writebyte(SLAVE_DROP)
            writebyte(sid)
            writebyte(cjp)
            slave_sendall()
            break;
            
        // update text and position. maybe set something up in case of conflicts
        case MU_MOVE:
          sid = readbyte();
          mx[sid] = readint();
          my[sid] = readint();
          mz[sid] = readint();
          mxspd[sid] = readint();
          myspd[sid] = readint();
          mzspd[sid] = readint();
          mfdir[sid] = readshort();
          mmdir[sid] = readshort();
          clearbuffer();
          writebyte(MU_MOVE);
          writebyte(sid);
          writeint(mx[sid]);
          writeint(my[sid]);
          writeint(mz[sid]);
          writeint(mxspd[sid]);
          writeint(myspd[sid]);
          writeint(mzspd[sid]);
          writeshort(mfdir);
          writeshort(mmdir);
          slave_sendall();
          pchar[sid].x = mx[sid];
          pchar[sid].y = my[sid];
          pchar[sid].z = mz[sid];
          pchar[sid].xspd = mxspd[sid];
          pchar[sid].yspd = myspd[sid];
          pchar[sid].zspd = mzspd[sid];
          pchar[sid].dir_face = mfdir[sid];
          pchar[sid].dir_move = mmdir[sid];
          break;
            
        // this is complicated: you need to create objects 2 steps ahead to make up for lost time
        case MU_ATK:
            sid = readbyte();
            matkobj = readint();
            //matkstat[sid] = readint();
            matkx = readint();
            matky = readint();
            //mspd[sid] = readint();
            mfdir[sid] = readint();
            mrng = readint();
            mdmg = readint();
            //create a projectile object with the stats in place
            lastcreated = instance_create(matkx,matky,matkobj);
            lastcreated.controlling_player = sid;
            lastcreated.dir = mfdir[sid];
            lastcreated.dmg = mdmg;
            with (lastcreated){event_user(0);}
            lastcreated.alarm[0] = mrng*16 div lastcreated.spd;
            
            clearbuffer()
            writebyte(MU_ATK)
            writebyte(sid)
            writeint(matkobj)
            //writeint(matkstat[sid])
            writeint(matkx)
            writeint(matky)
            //writeint([sid])
            writeint(mfdir[sid])
            writeint(mrng)
            writeint(mdmg)
            slave_sendall()
            break;
            
        // update everything to make sure nothings messed up
        case MU_STEP:
            sid = readbyte();
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
//transmit back to everyone else. This is going to be bad.
            clearbuffer()
            writebyte(MU_STEP);
            writebyte(sid);
            writeint(mu_hp[sid]);
            writeint(mu_ep[sid]);
            writeint(mx[sid]);
            writeint(my[sid]);
            writeint(mxspd[sid]);
            writeint(myspd[sid]);
            writebyte(msneaking[sid]);
            writebyte(mdodge[sid]);
            slave_sendall();
            if (msneaking[sid]){
              pchar[sid].image_alpha = 0.5;
            }else{
              pchar[sid].image_alpha = 1;
            }
            break;
            
                    // update everything to make sure nothings messed up
        case MU_DEAD:
            sid = readbyte();
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
//transmit back to everyone else. This is going to be bad.
            clearbuffer()
            writebyte(MU_DEAD);
            writebyte(sid);
            writeint(mu_hp[sid]);
            writeint(mu_ep[sid]);
            writeint(mx[sid]);
            writeint(my[sid]);
            writeint(mxspd[sid]);
            writeint(myspd[sid]);
            slave_sendall();
            break;
            
        case MU_MAG:
            main_unit_magic_master();  
            break;

        case MU_GET:
            sid = readbyte();
            crnt_npcid = readint();
            crnt_obj = readint();
            crnt_x = readint();
            crnt_y = readint();
            //if instance exists
            if (npcid_array[crnt_npcid] > 0)
                {
                if (npcid_array[crnt_npcid].object_index == crnt_obj) && (npcid_array[crnt_npcid].x == crnt_x) && (npcid_array[crnt_npcid].y == crnt_y)
                    {
                    clearbuffer();
                    writebyte(MU_GET);
                    writebyte(1);
                    writeint(crnt_npcid);
                    writeint(crnt_obj);
                    writeint(crnt_x);
                    writeint(crnt_y);
                    sendmessage(socket[sid])
                    with npcid_array[crnt_npcid]
                        {
                        instance_destroy();
                        }
                    }
                }
            else
                {
                clearbuffer();
                writebyte(MU_GET);
                writebyte(0);
                writeint(0);
                writeint(0);
                writeint(0);
                writeint(0);
                sendmessage(socket[sid])
                }
            break;
            
        //someone is ready to go through a portal
        case NEXT_ROOM:
            mp_next_room();
            break;

            
        case NPC_DMG:
            sid = readbyte();
            crnt_npcid = readint();
            dmg_sustained = readint();
            dmg_direction = readint();
            if instance_exists(npcid_array[crnt_npcid])
                {
                with npcid_array[crnt_npcid]
                    {
                    dmg_sustained = obj_mastercontrol.dmg_sustained;
                    dmg_direction = obj_mastercontrol.dmg_direction;
                    npc_damage()
                    }
                clearbuffer();
                writebyte(NPC_DMG);
                writebyte(sid);
                writeint(crnt_npcid);
                writeint(dmg_sustained);
                writeint(dmg_direction);
                slave_sendall();
                }
            break;
            
        case SLAVE_READY:
            sid = readbyte();
            nextroom_id = readint();
            global.startx = readint();
            global.starty = readint();
            nr_ready[sid] = 1;
            the_way_is_ready = true;
            for(i=1;i<cjp;i+=1){
              if (!nr_ready[i]){
                the_way_is_ready = false;
              }
            }
            if (the_way_is_ready){
              roomprevious = room_id;
              room_goto(room_index[nextroom_id]);
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
            clearbuffer();
            writebyte(MU_FX);
            writebyte(sid);
            writeint(tar_x);
            writeint(tar_y);
            writeint(crnt_obj);
            writeint(crnt_dur);
            slave_sendall();
            break;
            
        case MU_SAVE:
            sid = readbyte();
            //instruction = readbyte();
            clearbuffer();
            writebyte(MU_SAVE);
            slave_sendall();
            lastcreated = instance_create(x,y,obj_fltext_global);
            lastcreated.text = (pname[sid] + " has saved the game.");
            lastcreated.color = c_green;
            break;
            
        case NEXT_CHAMBER:
          mp_next_chamber();
          break;
  }
}
