/*Process Jump Command for Gnolls
  jump 

*/
//set variables


if (jump_btn){//if jump key pressed
  //check conditions
  if (z == base_z && !jumping){//temporarily just check if he's on the ground
    zspd += 20;
  }
}
