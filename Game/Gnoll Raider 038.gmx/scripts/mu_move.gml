
clearbuffer();
writebyte(MU_MOVE);
writebyte(crnt_pnum);
writeint(x);
writeint(y);
writeint(z);
writeint(xspd);
writeint(yspd);
writeint(zspd);
writeshort(dir_face);
writeshort(dir_move);
if (global.master)
    {
    slave_sendall();
    }
else
    {
    sendmessage(server);
    }
    
/*
THIS IS WHAT THE MASTER RECEIVES
mx[sid] = readint()
my[sid] = readint()
mhspd[sid] = readint()
mvspd[sid] = readint()
