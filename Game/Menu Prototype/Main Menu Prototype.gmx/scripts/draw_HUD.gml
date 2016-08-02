var xpos,ypos,w,h,top,left;
xpos = view_xview;
ypos = view_yview;

//Draw_Bottom_Right
  //draw lifebar
  w = 107*(mu_hp[crnt_pnum]/mu_mhp[crnt_pnum]);
  left = 107 - w;
  draw_sprite_part(spr_HUD_lifebar,0,left,0,w,16,xpos+384+164+(107-w),ypos+496+164);
  //draw energybar
  w = 130*(mu_ep[crnt_pnum]/mu_mep[crnt_pnum]);
  left = 130 - w;
  draw_sprite_part(spr_HUD_energybar,0,left,0,w,15,xpos+384+141+(130-w),ypos+496+188);
draw_sprite(spr_HUD_SE,0,xpos+384,ypos+496);
  //draw portrait
  if(mu_hp[crnt_pnum] > 0){
    draw_sprite(spricon[mu_spr[crnt_pnum]],mu_icon[crnt_pnum],xpos+384+304,ypos+496+128);
  }else{
    draw_sprite_ext(spricon[mu_spr[crnt_pnum]],mu_icon[crnt_pnum],xpos+384+304,ypos+496+128,1,1,0,c_black,1);
  }
  //draw name
  draw_text(xpos+384+196,ypos+496+80,(pname[crnt_pnum]));
  //draw gold
  draw_sprite(spr_coin_large_0,0,xpos+384+196,ypos+496+120);
  draw_text(xpos+384+224,ypos+496+112,':' + string(gold));

