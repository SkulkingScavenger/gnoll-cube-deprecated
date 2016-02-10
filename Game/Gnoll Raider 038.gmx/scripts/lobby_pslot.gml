var maxpos,minpos, spot_taken;

arg0 = 1
maxpos = 8
minpos = 1


i = (pslot[crnt_pnum] + arg0) // next slot down = pslot[2] i = 3
while i != pslot[crnt_pnum] // while i is not pslot[1]
    {
    j = 0
    spot_taken = false
    while j < cjp       // run through each player ID and check if any are using that slot
        {
        if pslot[j] == i // check if player 1 is at pslot[2] (3) ifpslot[0] == 3, he's there
            {               // if player 2 is at pslot[2] (3) ifpslot[1] == 3, he's there
            spot_taken = true; //we know that neither of these people is at pslot[2]
            break;
            }
        else
            {
            j += 1;
            }
        }
    if spot_taken == false //so move there.
        {
        return i
        exit;
        }
    else
        {
        if i != maxpos
            {
            i += arg0
            }
        else
            {
            i = minpos
            }
        }   
    }
return -1

