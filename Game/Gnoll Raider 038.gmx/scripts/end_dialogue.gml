//cleans up the dialogue
//argument0 = target_npc
//argument1 = dlg_menu

//reset variables
with argument0
    {
    conversing = false;
    talking = false;
    dlg_over = false;
    talk_i = 0;
    talk_j = 0;
    talk_char = '';
    }

with argument1
    {
    instance_destroy();
    }
