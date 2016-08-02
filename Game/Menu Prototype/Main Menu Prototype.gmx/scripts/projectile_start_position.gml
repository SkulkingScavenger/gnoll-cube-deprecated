var target, crnt_dir;
target = argument0;
crnt_dir = argument1;
switch((crnt_dir+22.5) div 45){
  case 0://East
    target.x += 48;
    target.y += 16;
    break;
  case 1://North East
    target.x += 32;
    target.y -= 0;
    break;
  case 2://North
    target.x += 16;
    target.y -= 16;
    break;
  case 3://North West
    target.x -= 0;
    target.y -= 0;
    break;
  case 4: //West
    target.x -= 16;
    target.y += 16;
    break;
  case 5://South West
    target.x -= 0;
    target.y += 32;
    break;
  case 6://South
    target.x += 16;
    target.y += 48;
    break;
  case 7://South East
    target.x += 32;
    target.y += 32;
    break;
}
target.y -= 8;//compensate for mask_height gap
/*
switch((crnt_dir+22.5) div 45){
  case 0://East
    target.x += 64;
    target.y += 32;
    break;
  case 1://North East
    target.x += 48;
    target.y -= 16;
    break;
  case 2://North
    target.x += 16;
    target.y -= 32;
    break;
  case 3://North West
    target.x -= 16;
    target.y -= 16;
    break;
  case 4: //West
    target.x -= 32;
    target.y += 16;
    break;
  case 5://South West
    target.x -= 16;
    target.y += 48;
    break;
  case 6://South
    target.x += 16;
    target.y += 64;
    break;
  case 7://South East
    target.x += 48;
    target.y += 48;
    break;
}


