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
