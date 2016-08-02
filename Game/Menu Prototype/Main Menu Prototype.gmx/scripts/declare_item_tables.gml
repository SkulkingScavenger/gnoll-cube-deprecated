globalvar item_name, item_tooltip, item_invobj, item_price, item_maxstacks, item_obj;
globalvar item_icons, coinind, corpseind;
/*
item_xxx[i,j]
xxx = item stat; i = item category; j = item index

ITEM CATEGORIES
0 = treasure
1 = useable
2 = weapon
3 = armor
4 = other
5 = key item

ITEM STATS
item_name = string name, used in displays and tooltips
item_tooltip = extended tooltip
item_invobj = object displayed in inventory, parses commands in inventory
item_obj = (OFF)object form when item is on the ground
item_price = base price of item (without discounts or markups. sells for 50% avg)
item_maxstacks = default 1, only applies to 0&1
*/

item_icons[0] = spr_item_icon_trsr;
item_icons[1] = spr_item_icon_use;
item_icons[2] = spr_item_icon_wpn;
item_icons[3] = spr_item_icon_armr;
item_icons[4] = spr_item_icon_spc;
item_icons[5] = spr_item_icon_key;

//TREASURE ITEMS
item_name[0,0] = "Shiny Rock";
item_tooltip[0,0] = "An absolutely worthless rock. It is admittedly rather shiny though.";
item_invobj[0,0] = obj_menu_start_item_0_00;
item_price[0,0] = 1;
item_maxstacks[0,0] = 10;
//item_obj[0][0] = obj_treasure_shinyrock;

item_name[0,1] = "Flashy Trinket";
item_tooltip[0,1] = "A really, genuinely, fascinatingly trinket. If only someone would actually pay money for it...";
//item_invobj[0,1] = obj_menu_start_item_0_01;
item_price[0,1] = 1;
item_maxstacks[0,1] = 10;
//item_obj[0,1] = obj_treasure_flashytrinket

item_name[0,2] = "Nifty Nugget";
item_tooltip[0,2] = "This sure is one heck of a nugget. You aren't sure whether its made of gold or chicken";
//item_invobj[0,2] = obj_menu_start_item_0_02;
item_price[0,2] = 1;
item_maxstacks[0,2] = 20;
//item_obj[0,2] = obj_treasure_niftynugget

//USEABLE ITEMS
item_name[1,0] = "Stale Biscuit";
item_tooltip[1,0] = "Recovers 1 energy point. Use in case of emergency or whenever you feel like suffering.";
item_invobj[1,0] = obj_menu_start_item_1_00;
item_price[1,0] = 1;
item_maxstacks[1,0] = 10;
//item_obj[1][0] = obj_usable_food_00;

item_name[1,1] = "Dirty Bandages";
item_tooltip[1,1] = "Heals a measly 1 hitpoint wound. Surprising, really.";
item_invobj[1,1] = obj_menu_start_item_1_01;
item_price[1,1] = 2;
item_maxstacks[1,1] = 10;
//item_obj[1][1] = obj_usable_medicine_00;

usablename[1,2] = "Weak Poison";
usabletooltip[1,2] = "A dose of cheap, watered down poison.# DC: 2, DPS: 1, Dur. 2 sec";
item_invobj[1,2] = 3;
item_price[1,2] = 4;
item_maxstacks[1,2] = 3;
//item_obj[1,2] = obj_usable_poison_00;


//WEAPON ITEMS
item_name[2,0] = "Rusty Scimitar";
item_tooltip[2,0] = "A rusty old scimitar nobody else wanted";
item_invobj[2,0] = 3;//obj_inv_wpnitem_scimitar_00;
item_price[2,0] = 10;
item_maxstacks[2,0] = 1;
//wpnitemind[2,0] = obj_wpnitem_scimitar_00;

//ARMOR ITEMS
item_name[3,0] = "Moldy Cloth Armor";
item_tooltip[3,0] = "This rotting patchwork garment will cushion some blows, but what will cushion the smell?";
item_invobj[3,0] = 3;//obj_inv_wpnitem_scimitar_00;
item_price[3,0] = 20;
item_maxstacks[3,0] = 1;
//item_[3,0] = obj_wpnitem_scimitar_00;

//SPECIAL/OTHER ITEMS
item_name[4,0] = "Witch Doctor Hat";
item_tooltip[4,0] = "With this, you can finally look almost as cool as the great witchdoctor Hazrak!";
item_invobj[4,0] = 3;
item_price[4,0] = 500;
item_maxstacks[4,0] = 1;
//item_[4,0] = obj_wpnitem_scimitar_00;

//KEY ITEMS
item_name[5,0] = "Head of Throk";
item_tooltip[5,0] = "The severed Head of the Terrible King Throk";
item_invobj[5,0] = 3;//obj_inv_keyitem_;
//item_obj[5,0] = obj_keyitem_headofthrok;


//declare coins separately(index 6)
coinind[0] = obj_coin_001
coinind[1] = obj_coin_001
coinind[2] = obj_coin_001

//declare corpses separately
corpseind[1] = obj_corpse_01
corpseind[2] = obj_corpse_02
