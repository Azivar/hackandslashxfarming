/// @description Insert description here
// You can write your code in this editor
light[| eLight.X] = x
light[| eLight.Y] = y
light[| eLight.Direction] = direction;
ttl--;
if (ttl < ttlMax ) {
	if image_alpha > 0{
	image_alpha-=choose(0.04,0.02,0.03);
	}else{
	instance_destroy();
	}
}    
if (place_meeting(x,y,obj_wall))instance_destroy()