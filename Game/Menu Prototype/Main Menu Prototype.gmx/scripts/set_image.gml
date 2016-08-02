var crnt_image,crnt_dir;
crnt_image = argument0;
crnt_dir = argument1;


switch ((crnt_dir+22.5) div 45)
    {
    case 0:
        sprite_index = sprEE[crnt_image];
        break;
        
    case 1:
        sprite_index = sprNE[crnt_image];
        break;
        
    case 2:
        sprite_index = sprNN[crnt_image];
        break;
        
    case 3:
        sprite_index = sprNW[crnt_image];
        break;
        
    case 4:
        sprite_index = sprWW[crnt_image];
        break;
        
    case 5:
        sprite_index = sprSW[crnt_image];
        break;
        
    case 6:
        sprite_index = sprSS[crnt_image];
        break;
        
    case 7:
        sprite_index = sprSE[crnt_image];
        break;
        
    case 8:
        sprite_index = sprEE[crnt_image];
        break;
    }
