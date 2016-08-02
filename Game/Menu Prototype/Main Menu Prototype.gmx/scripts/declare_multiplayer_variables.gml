
globalvar pname, cjp, pslot, ready, cjpincreased, socket;
cjp = 1
xposition = 0
yposition = 0
keyboard_string = ''
cjpincreased = false
//alarm[0] = 30

//declare player arrays
/*
global.player[1] = 0
global.player[2] = 0
global.player[3] = 0
global.player[4] = 0
global.player[5] = 0
global.player[6] = 0
global.player[7] = 0
*/

//declare player sockets
socket[1] = 0
socket[2] = 0
socket[3] = 0
socket[4] = 0
socket[5] = 0
socket[6] = 0
socket[7] = 0

/*
global.udpsocket[1] = 0
global.udpsocket[2] = 0
global.udpsocket[3] = 0
global.udpsocket[4] = 0
global.udpsocket[5] = 0
global.udpsocket[6] = 0
global.udpsocket[7] = 0
*/

//declare send sockets
//temporary_socket = 0

//declare player name objects
//how do these work again? so one number is the ID and the other is the "player number"
//the index is probably the ID
pslot[0] = 1
pslot[1] = 2
pslot[2] = 3
pslot[3] = 4
pslot[4] = 5
pslot[5] = 6
pslot[6] = 7
pslot[7] = 8


//declare player names
pname[0] = ''
pname[1] = ''
pname[2] = ''
pname[3] = ''
pname[4] = ''
pname[5] = ''
pname[6] = ''
pname[7] = ''

//declare readiness
ready[0] = false
ready[1] = false
ready[2] = false
ready[3] = false
ready[4] = false
ready[5] = false
ready[6] = false
ready[7] = false

//declare sprites
mu_spr[0] = 0
mu_spr[1] = 0
mu_spr[2] = 0
mu_spr[3] = 0
mu_spr[4] = 0
mu_spr[5] = 0
mu_spr[6] = 0
mu_spr[7] = 0

//declare icons
mu_icon[0] = 0
mu_icon[1] = 0
mu_icon[2] = 0
mu_icon[3] = 0
mu_icon[4] = 0
mu_icon[5] = 0
mu_icon[6] = 0
mu_icon[7] = 0

/*
//declare freaking ip_addresses to check
global.iplist = ds_list_create()
ds_list_add(global.iplist,'192.168.1.89')
ds_list_add(global.iplist,'192.168.1.99')
ds_list_add(global.iplist,'192.168.1.67')
ds_list_add(global.iplist,'192.168.1.89')

/*
//declare player texts
ptext[0] = ''
ptext[1] = 0
ptext[2] = 0
ptext[3] = 0
ptext[4] = 0
ptext[5] = 0
ptext[6] = 0
ptext[7] = 0
ptext[8] = 0
*/


