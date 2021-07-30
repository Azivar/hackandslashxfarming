///@description Initialise grid for AI path finding
//NOTE: this object must be created first in each room so the grid is created before the other objects check the grid

randomise();//randomize GameMaker's seed for random functions to be actually random

//initialise grid
var _cellSize = 128;//width and height of cells to split the room into to create a grid
global.aiGrid = mp_grid_create(0,0,ceil(room_width/_cellSize),ceil(room_height/_cellSize),_cellSize,_cellSize);
//add objects to avoid for path finding
mp_grid_add_instances(global.aiGrid,obj_wall,false);//parent object for walls

mp_potential_settings(45,10,3,true);

//debug
global.dbug = false;
