#define chamber_module_00
var w,h,i,j,x_offset,y_offset;
w = argument0;
h = argument1;
x_offset = argument2;
y_offset = argument3;


for(i=0;i<h;i+=1){
  for(j=0;j<w;j+=1){
    lastcreated = instance_create(0,0,obj_abstract);
    lastcreated.cell_x = j*cell_w + x_offset;
    lastcreated.cell_y = i*cell_h + (cell_h/2) + y_offset;
    lastcreated.cell_z = 0;
    lastcreated.cell_type = obj_floor;
    lastcreated.chamber = id;
    ds_list_add(cell_list,lastcreated);
    
    lastcreated = instance_create(0,0,obj_abstract);
    lastcreated.cell_x = j*cell_w + (cell_w/2) + x_offset;
    lastcreated.cell_y = i*cell_h + cell_h + y_offset;
    lastcreated.cell_z = 0;
    lastcreated.cell_type = obj_floor;
    lastcreated.chamber = id;
    ds_list_add(cell_list,lastcreated);
  }
}
startlocation_main = lastcreated;// just some dumb placeholder as I'm too lazy to make the real startlocation

  lastcreated = instance_create(0,0,obj_abstract);
  lastcreated.cell_x = 288 + x_offset;
  lastcreated.cell_y = 304 + y_offset;
  lastcreated.cell_z = 0;
  lastcreated.cell_type = obj_doodad_rock;
  lastcreated.chamber = id;
  ds_list_add(cell_list,lastcreated);

  lastcreated = instance_create(0,0,obj_abstract);
  lastcreated.npc_x = 300 + (cell_w/2) + x_offset;
  lastcreated.npc_y = 60 + cell_h + y_offset;
  lastcreated.npc_z = 0;
  lastcreated.npc_type = obj_rakasha;
  lastcreated.npc_hp = 0;
  lastcreated.chamber = id;
  ds_list_add(npc_list,lastcreated);

#define chamber_module_stair
var w,h,i,j,region_w;
w = 2;
h = 2;
region_w = 768;
chunk_count = 0;
for(i=0;i<h;i+=1){
  for(j=0;j<w;j+=1){
    create_region(j,i,region_w);
  }
}

///generate walls
w = room_width div cell_w;
h = room_height div cell_h;
for(i=0;i<w;i+=1){
  //north wall
  instance_create(i*cell_w,-1*(cell_h/2),obj_wall);
  instance_create(i*cell_w+(cell_w/2),0,obj_wall);
  
  //south wall
  instance_create(i*cell_w+(cell_w/2),room_height-(cell_h/2),obj_wall);
  instance_create(i*cell_w,room_height-cell_h,obj_wall);
}

for(i=0;i<h+1;i+=1){
  //east wall
  instance_create(-1*cell_w/2,i*cell_h,obj_wall);
  
  //west wall
  instance_create(room_width-cell_w/2,(i*cell_h)-(cell_h*0.5),obj_wall);
}

is_defined = true;

#define generate_dungeon
var chamber_count,current_chamber,grid,temp,num,l,i,j;
chamber_count = argument0;

//create grid
for(i=0;i<chamber_count*2-1;i+=1){
  for(j=0;j<chamber_count*2-1;j+=1){
    grid[i,j]= noone;
  }
}
x = chamber_count - 1;
y = chamber_count - 1;

//randomly generate the maze by tracing a random path through the grid
destined_chamber = instance_create(0,0,obj_chamber);
current_chamber = destined_chamber;
current_chamber.chamber_x = x;
current_chamber.chamber_y = y;
ds_list_add(chamber_list,current_chamber);
grid[x,y] = current_chamber;
for(i=0;i<chamber_count-1;i+=1){
  num = floor(random(4));
  l = ds_list_size(chamber_list);
  while(true){
    switch(num){
    case 0://east
      x += 1;
      break;
    case 1://north
      y -= 1;
      break;
    case 2://west
      x -= 1;
      break;
    case 3://south
      y += 1;
      break;
    }
    temp = grid[x,y];
    if(temp != noone){
      current_chamber.adjacent[num] = temp;
      temp.adjacent[(num+2)mod 4] = current_chamber;
      //secret door check here
      current_chamber = temp;
    }else{
      break;
    }
  }
  temp = instance_create(0,0,obj_chamber);
  grid[x,y] = temp;
  ds_list_add(chamber_list,temp);
  current_chamber.adjacent[num] = temp;
  temp.adjacent[(num+2)mod 4] = current_chamber;
  //secret door check here
  current_chamber = temp;
  current_chamber.chamber_x = x;
  current_chamber.chamber_y = y;
}

l = ds_list_size(chamber_list);
for(i=0;i<l;i+=1){
  temp = ds_list_find_value(chamber_list,i);
  temp.dungeon = id;
}

stair_chamber = destined_chamber;
l = ds_list_size(chamber_list);
if(l>1){
  while(stair_chamber == destined_chamber){
    stair_chamber = ds_list_find_value(chamber_list,floor(random(l)));
  }
  with (stair_chamber){
    script_execute(dungeon.stair_template);
  }
}

#define create_region
var xpos,ypos,w,offset_x,offset_y;
xpos = argument0;
ypos = argument1;
w = argument2;
offset_x = xpos*w;
offset_y = ypos*w;

chamber_module_00(w/cell_w,w/cell_h,offset_x,offset_y);


#define generate_chamber
var w,h,i,j,region_w;
w = argument0;
h = argument1;
region_w = 768;
chunk_count = 0;
for(i=0;i<h;i+=1){
  for(j=0;j<w;j+=1){
    create_region(j,i,region_w);
  }
}

///generate walls
w = room_width div cell_w;
h = room_height div cell_h;
for(i=0;i<w;i+=1){
  //north wall
  instance_create(i*cell_w,-1*(cell_h/2),obj_wall);
  instance_create(i*cell_w+(cell_w/2),0,obj_wall);
  
  //south wall
  instance_create(i*cell_w+(cell_w/2),room_height-(cell_h/2),obj_wall);
  instance_create(i*cell_w,room_height-cell_h,obj_wall);
}

for(i=0;i<h+1;i+=1){
  //east wall
  instance_create(-1*cell_w/2,i*cell_h,obj_wall);
  
  //west wall
  instance_create(room_width-cell_w/2,(i*cell_h)-(cell_h*0.5),obj_wall);
}

is_defined = true;

#define find_patrol_routes
/*
Patrol Route
Take a list of all nodes
For each node, determine adjacent neighbors
  adjacent neighbors have direct LoS
  adjacent neighbors are closer to current node than to any other adjacent neighbors
For each node:
  if node has exactly one neighbor
*/

var nodes,current,i,j,adj;
nodes = ds_list_create();
routes = ds_list_create();

l = instance_number(obj_patrol_node);
for(i=0;i<l;i+=1){
  current = instance_find(obj_patrol_node,i);
  ds_list_add(nodes,current);
}

for(i=0;i<l;i+=1){
  current = ds_list_find_value(nodes,i);
  for(j=0;j<l;j+=1){
    adj = ds_list_find_value(nodes,i);
    if(i!=j){
      if(collision_line(current.x,current.y,adj.x,adj.y,obj_wall,false,true)<0){
        ds_list_add(current.adjacent_nodes,adj);
      }
    }
  }
}

while(!ds_list_empty(nodes)){
  current = ds_list_find_value(nodes,0);
  lastcreated = instance_create(obj_patrol_route,0,0);
  ds_list_add(routes,lastcreated);
  recurso_patrol(current,lastcreated,nodes);
}
ds_list_destroy(nodes);
return routes;



#define recurso_patrol
var node,route,list,l,i,first,second;
node = argument0;
route = argument1;
list = argument2;
ds_list_delete(list,ds_list_find_index(list,node));
l = ds_list_size(node.adjacent_nodes);
first = ds_list_find_value(node.adjacent_nodes,0);
if (l > 1){
  if (previous == noone){
    for(i=1;i<l;i+=1){
      temp = ds_list_find_value(node.adjacent_nodes,1);
      if(point_distance(node.x,node.y,temp.x,temp.y) < point_distance(node.x,node.y,first.x,first.y)){
        second = first;
        first = temp;
      }else if(i==1){
        second = temp;
      }else if(point_distance(node.x,node.y,temp.x,temp.y) < point_distance(node.x,node.y,second.x,second.y)){
        second = temp;
      }
    }
  }
  
}


