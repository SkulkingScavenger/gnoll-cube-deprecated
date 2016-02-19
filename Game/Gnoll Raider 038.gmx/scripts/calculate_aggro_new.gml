var target,aggro;
target = argument0;

if(ds_list_find_index(enemy_list,target) == -1){
  aggro = 0;
}else{
  aggro = 1;//fix this later moron
}
return aggro;

/*
Basic
if has LoS: + 25
if has peripheral LoS + 50
if can hear him: + 50

if distance < threat_range: + 50

if 
