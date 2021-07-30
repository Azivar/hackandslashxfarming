// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Use_OleWest(dir,_x,_y){
	with(instance_create_layer(_x,_y,bullet_layer,obj_bullet)){
		dmg = 6
		speed = 60;
		direction = dir 
		image_angle = dir-90
		light[| eLight.Direction] = dir;
	}
	obj_player.fireing = 50;
}