var map,open,neighbors,tile,neighbor,region_l,region_count;
map = ds_map_create();
open = ds_map_create();
closed = ds_map_create();
region_count = 0;
with(obj_terrain_parent){
  ds_map_add(map,id,0);
}
//go through it
while(!ds_map_empty(map)){
  obj = ds_map_find_first(map);
  //Algorith Begin
  region_l = ds_list_create();
  m_add(open,obj,0);
  while(!ds_map_empty(open)){
    obj = ds_map_find_first(open);
    m_add(closed,obj,0);
    ds_map_delete(open,obj);
    ds_map_delete(map,obj);
    //check if pathable
    flag = true;
    s = ds_list_size(region_l);
    for(i=0;i<s;i+=1){
      tile = l_get(region_l,i);
      if(!node_path_pathable(obj,tile,1)){
        flag = false;
      }
    }
    if(flag){
      //if pathable, check its neighbors too
      l_add(region_l,obj);
      obj.region = region_count;
      neighbors = get_iso_area(obj.x,obj.y,2);
      for(i=0;i<9;i+=1){
        neighbor = l_get(neighbors,i);
        if (ds_map_exists(map,neighbor)){
          ds_map_add(open,neighbor,0);
        }
      }
      ds_list_destroy(neighbors);
    }
  }
  //Algorithm End
  region = instance_create(0,0,obj_region);
  region.tile_list = region_l;
  region.region_id = region_count;
  region.initialized = true;
  region_count +=1;
  ds_map_clear(open);
  ds_map_clear(closed);
}

ds_map_destroy(map);
ds_map_destroy(open);
ds_map_destroy(closed);
