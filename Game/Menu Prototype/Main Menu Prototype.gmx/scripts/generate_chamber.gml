//Virtual Maze
/*
This version generates an abstract room from a schematic
*/

var my_number, my_script, l;

if (!is_determined){
  l = ds_list_size(dungeon.chamber_schematics_list);
  my_number = floor(random(l));
  my_script = dungeon.chamber_schematics_list[|my_number];
  script_execute(my_script);
}
