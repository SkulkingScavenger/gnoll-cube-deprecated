//argument0 = x
//argument1 = y
//argument2 = object index of desired effect
//argument3 = duration

clearbuffer();
writebyte(MU_FX);
writebyte(crnt_pnum);
writeint(argument0);
writeint(argument1);
writeint(argument2);
writeint(argument3);
if (global.master)
    {
    slave_sendall();
    }
else
    {
    sendmessage(server);
    }
