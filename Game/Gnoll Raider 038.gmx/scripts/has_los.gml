///Has Line of Sight
/**
Returns true if there are no vision obstructing objects between the calling instance and argument0
*/
var output,terrain_tiles,target,l;
target = argument0;
output = true;
//check terrain for blockages
terrain_tiles = get_terrain_line(x,y,target.x,target.y);
l = ds_list_size(terrain_tiles);
for(i=0;i<l;i+=1){
  if (terrain_tiles[|i].z > z){
    output = false;
    break;
  }
}
//check doodads for blockages
collision_keeper = ds_list_create();
with(obj_doodad_parent){
  ds_list_add(collision_keeper,id);
}
ds_list_destroy(collision_keeper);
ds_list_destroy(terrain_tiles);
return output;
