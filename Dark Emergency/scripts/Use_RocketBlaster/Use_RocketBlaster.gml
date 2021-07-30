// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Use_RocketBlaster(dir,_x,_y){
	with(instance_create_layer(_x,_y,bullet_layer,obj_rocket)){
		dmg = 30
		speed = 40;
		direction = dir
		image_angle = dir
		light[| eLight.Direction] = dir;
	}
	obj_player.fireing = 300;
}