/// @description Insert description here
// You can write your code in this editor
_x = x
_y = y
ttl--;
var inst = instance_create_layer(choose(x+irandom(width*0.5),x-irandom(width)*0.5),y,"fire",flame_light);
with(inst){
		sprite_index  = spr_fire3
		speed = 20
		direction = other.direction + irandom_range(-10,10)
}
var inst = instance_create_layer(choose(x+irandom(width*0.5),x-irandom(width)*0.5),y,"fire",flame_light);
with(inst){
		sprite_index  = spr_fire3
		speed = 20
		direction = other.direction + irandom_range(-10,10)
}

 