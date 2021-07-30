/// @description Init
hp = 10
flash = 0;
walkSprite = spr_zombie;//sprite to use when walking
walkAnimateSpd = 0;//speed to animate walkSprite
sprite_index = spr_zombie;
image_speed = 0;
image_index = 1;
attackSprite = spr_zombie;//sprite to use for attacking target
attackAnimateSpd = 0;//speed to animate attackSprite
leftRight = false;//whether sprites are left-right facing (true) or top-down (false). left-right facing assumes the sprites face the right and will inverse image_xscale for changing direction.
feetSprite = -1;//(-1 for none)
feetAnimateSpd = 0.1;//speed to animate feetSprite
feetIndex = 0;
angle = 0;
image_xscale = size
image_yscale = size

spd = 4;//set movement speed
sight = 2000;//set how far the AI can see
range = 150;//set how far the AI can attack from
turnSpd = 8;//set how fast the AI rotates
attackDelay = 30;//set how long after shooting before the AI can shoot agAIn
direction = irandom(360);
target = obj_player;//set the object the AI attacks
obstacle = obj_wall;//set the object(s) to avoid (for more than one object use a parent object)
vision = 2;//set whether the AI can follow the target anywhere in sight (0) or only within a rectangle of vision (1) or only within a cone of vision (2)
visionConeAngle = 35;//set angle for vision cone (length is sight)
visionRectWidth = sight/2;//set width for vision rectangle (length is sight)
rememberTargetTime = 200;//steps after AI loses sight/line of sight to target to keep chasing target
losXOffset = 25;//horizontal distance in pixels from sprite origin of AI to start check for line of sight to target
losYOffset = 5;//vertical distance in pixels from sprite origin of AI to start check for line of sight to target
losWidth = sprite_get_height(spr_bullet);//the width of the line of sight to target
_layer = layer_get_id("attacks")
my_dmg = 1

//choose random empty location to roam to
roam = true;
var _cellSize = 128;
random_xy(1,1,(floor(room_width/_cellSize)*_cellSize)-2,(floor(room_height/_cellSize)*_cellSize)-2,obstacle);

//start path to random location
path = path_add();
mp_grid_path(global.aiGrid,path,x,y,rX,rY,1);
path_start(path,spd,path_action_stop,0);