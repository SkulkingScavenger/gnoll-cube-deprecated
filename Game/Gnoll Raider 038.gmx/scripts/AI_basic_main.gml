switch (state){
// Out of Combat
case "idle": //idle/sleeping
  //If enemy in range, change state
  break;
case "alert": //alert/patrol
  break;
case "hunting":
  break;
// In Combat
case "combat":
  AI_basic_combat();
  break;
// Death
case "dead":
  break;
}
