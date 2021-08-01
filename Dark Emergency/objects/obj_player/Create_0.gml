/// @description Insert description here
event_inherited()

sprite_index = spr_player_flashlight
image_xscale = size
image_yscale = size
image_speed = 0
image_angle = point_direction(x,y,mouse_x,mouse_y)
move_direction = -1
fireing = 0
bullet_layer = layer_get_id("bullets")
device = 4
_x = 0
_y = 0
angle = 0
three_round = 3
flame_Emitter = noone;
minigundelay = 40;

light2 = light_create_point(x, y, Light_Shadow_Length, Light_Color, Light_Range, Light_Intensity, Light_Width, Light_Direction);
if(LUT_Intensity != noone) {
	light2[| eLight.LutIntensity] = sprite_get_texture(LUT_Intensity, 0);
}

// Add the light to the world
light_add_to_world(light2);
light2[| eLight.Angle] = 180




