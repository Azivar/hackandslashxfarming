/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_timer)
draw_set_color(c_lime)
	draw_text(timer_w-cell_x*6,timer_h,"Day: " +string(day))
	draw_text(cell_x*15,timer_h,"DayLight " +string(global.daytime))
if (seconds < 10) and (minutes < 10){
	draw_text(timer_w,timer_h,string(hours) + ":0" + string(minutes) + ":0" + string(round(seconds)))	
}
else if (seconds >= 10) and ( minutes >= 10)
{
	draw_text(timer_w,timer_h,string(hours) + ":" + string(minutes) + ":" + string(round(seconds)))	
}
else if (seconds < 10) and (minutes >= 10)
{
	draw_text(timer_w,timer_h,string(hours) + ":" + string(minutes) + ":0" + string(round(seconds)))	
}
else if (seconds >= 10) and (minutes < 10)
{
	draw_text(timer_w,timer_h,string(hours) + ":0" + string(minutes) + ":" + string(round(seconds)))	
}

// Health Bar
draw_sprite_ext(spr_wood_health_background,0,cell_x*1,cell_y*1,.58,.35,0,c_white,1)
draw_healthbar((cell_x*1)+5,(cell_y*1)+5,cell_x*11,cell_y*5,((play_health/20)*100),c_black,c_red,c_red,0,false,false)
draw_sprite_ext(spr_wooden_health,0,cell_x*1,cell_y*1,2,.5,0,c_white,1)
// Health Bar
draw_sprite_ext(spr_wood_health_background,0,cell_x*1,cell_y*7,.58,.35,0,c_white,1)
draw_healthbar((cell_x*1)+5,(cell_y*7)+5,cell_x*11,cell_y*11,(play_stamina),c_black,c_yellow,c_yellow,0,false,false)
draw_sprite_ext(spr_wooden_health,0,cell_x*1,cell_y*7,2,.5,0,c_white,1)


var frame_scale = .45
var equppied_scale = .3
var gun_scale = .1

//Quick Equipped
keyQ = keyboard_check_pressed(ord("Q"))
if (keyQ){
	leftRight = !leftRight;
	
}
switch (leftRight){
	case 0://Slot 1
	draw_sprite_ext(spr_quick_equipped,0,cell_x*2,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);		
	draw_sprite_ext(spr_quick_equip_frame,0,cell_x*2,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[0],cell_x*2-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
		//SLot 2
	draw_sprite_ext(spr_quick_equipped,1,cell_x*8,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);
	draw_sprite_ext(spr_quick_equip_frame,1,cell_x*8,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[1],cell_x*8-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
	break;
	case 1://Slot 1
	draw_sprite_ext(spr_quick_equipped,1,cell_x*2,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);
	draw_sprite_ext(spr_quick_equip_frame,0,cell_x*2,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[0],cell_x*2-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
		//Slot2
	draw_sprite_ext(spr_quick_equipped,0,cell_x*8,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);
	draw_sprite_ext(spr_quick_equip_frame,1,cell_x*8,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[1],cell_x*8-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
	break;	
}
var locked_slot_scale = .67
keyInv = keyboard_check_pressed(ord("I"));
if (keyInv){
	InvOpen = !InvOpen	
}
if (InvOpen){
		draw_sprite_ext(spr_inventory_background,0,cell_x*20,cell_y*8,1.5,1,0,c_dkgray,1)
		for (var i = 0;i < 8; i++){
			draw_sprite_ext(spr_inventory_slot_background,0,cell_x*21+(i*(cell_x*4.35)),cell_y*15,.5,.5,0,c_white,1)
		}
		for (var i = 0;i < 8; i++){
			if (!inventory16){
				draw_sprite_ext(spr_inventory_locked_slot,0,cell_x*21+(i*(cell_x*4.35)),cell_y*23,locked_slot_scale,locked_slot_scale,0,c_white,1)
			}else{
				draw_sprite_ext(spr_inventory_slot_background,0,cell_x*21+(i*(cell_x*4.35)),cell_y*23,.5,.5,0,c_white,1)
			}
		}
		for (var i = 0;i < 8; i++){
			if (!inventory24){
				draw_sprite_ext(spr_inventory_locked_slot,0,cell_x*21+(i*(cell_x*4.35)),cell_y*32,locked_slot_scale,locked_slot_scale,0,c_white,1)
			}else{
				draw_sprite_ext(spr_inventory_slot_background,0,cell_x*21+(i*(cell_x*4.35)),cell_y*31,.5,.5,0,c_white,1)
			}
		}
	
}










