/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x,y,mouse_x,mouse_y);
direction = image_angle

if (keyboard_check_pressed(ord("F"))){
	flashlight = !flashlight
}
#region Movement
var move_speed;
var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))
var _shift = keyboard_check(vk_shift)
if (_shift) and (play_stamina > 0 ){
	move_speed = run_speed	
}else {
	move_speed = walk_speed 
}
var _x_speed = 0;
_x_speed -= _left
_x_speed += _right
var _y_speed = 0;
_y_speed -= _up;
_y_speed += _down;
if (_y_speed != 0 or _x_speed != 0){
	move_direction = point_direction(0,0,_x_speed,_y_speed);
	if (move_speed == run_speed){
		play_stamina -= .25	;
	}else {
		play_stamina += .35;	
	}
}else{
	move_direction = -1	
}
movement_and_collision(move_direction,move_speed,obj_wall)
#endregion
fireing--;//down counter to use for fire rate

//WITH THIS I KNOW WHERE THE GUN IS---------------
angle = degtorad(image_angle)*-1
xoffset = +90;
yoffset = +32;
rotatedxoffset = xoffset * cos(angle) - yoffset * sin(angle);
rotatedyoffset = xoffset * sin(angle) + yoffset * cos(angle);
_x = x + rotatedxoffset;
_y = y + rotatedyoffset;
if (!flashlight){
	light[| eLight.Angle] = 0
}else {
	light[| eLight.Angle] = 30	
}
//Flashlight
light[| eLight.X] = _x
light[| eLight.Y] = _y
light[| eLight.Direction] = direction;
light2[| eLight.X] = x
light2[| eLight.Y] = y
light2[| eLight.Direction] = direction;
light2[| eLight.Intensity] = 0.5

if (mouse_check_button(mb_left) and (fireing < 0)){
	
	switch(global.use){
		case 0:
		//What do right here tho
		break;
		case 1:
			Use_YellowJacket(direction,_x,_y);
		break;
		case 2:
			three_round = 3;
			alarm[0] = 1;
		break;
		case 3:
			if(!instance_exists(obj_flame)){
				flame_Emitter = instance_create_layer(_x,_y,"fire",obj_flame);
			}else {
				with(flame_Emitter){
					x = other._x	
					y = other._y
					direction = other.direction
				}
			}
		break;
		case 4:
			Use_ShortTempered(direction,_x,_y);
		break;
		case 5:
			Use_DeadShot(direction,_x,_y);
		break;
		case 6:
			minigundelay--
			if (minigundelay < 0){
			Use_Minifun(direction,_x,_y);
			}
		break;
		case 7:
			Use_RocketBlaster(direction,_x,_y)
		break;
		case 8:
			Use_PlasmaRifle(direction,_x,_y)
		break;
		case 9:
			Use_Tomboi(direction,_x,_y);
		break;
		case 10:
			Use_OleWest(direction,_x,_y);
		break;
	}
}

if (mouse_check_button_released(mb_left)){
	if(instance_exists(flame_Emitter)){
		with(flame_Emitter){
			instance_destroy()
		}
	}
	minigundelay = 40
}
	

show_debug_message(string(global.use))


