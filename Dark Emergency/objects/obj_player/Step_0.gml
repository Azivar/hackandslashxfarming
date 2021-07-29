/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x,y,mouse_x,mouse_y);
direction = image_angle;
if (keyboard_check_pressed(ord("F"))){
	flashlight = !flashlight
}

	
#region Movement
if (keyboard_check(vk_shift)){
	move  = run_speed;	
}else{
	move = walk_speed; 	
}

if (keyboard_check(ord("W"))){
	if (speed < move){
		speed += 0.5	
	}
}
else
{
	if (speed > 0){
		speed -= 1
	}
}

if (keyboard_check(ord("S"))){
	if (speed > -move ){
		speed -= 0.5	
	}
}
else
{
	if (speed < 0){
		speed += 1;
	}
}
#endregion



angle = degtorad(image_angle)*-1

xoffset = +90;
yoffset = +32;

rotatedxoffset = xoffset * cos(angle) - yoffset * sin(angle);
rotatedyoffset = xoffset * sin(angle) + yoffset * cos(angle);

_x = x + rotatedxoffset;
_y = y + rotatedyoffset;

light[| eLight.X] = _x
light[| eLight.Y] = _y
light[| eLight.Direction] = direction;