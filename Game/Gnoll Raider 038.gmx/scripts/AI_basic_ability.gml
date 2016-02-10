if(!interrupted){
  channel_timer -= 1;
  
  if(channel_timer == 0){
    event_user(action_index);
    behavior = 1;
    image_speed = 0.25;
  }
}else{

}
