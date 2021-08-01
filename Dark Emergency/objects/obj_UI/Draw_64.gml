/// @description Insert description here
// You can write your code in this editor
draw_set_font(ft_timer)
draw_set_color(c_lime)
	draw_text(timer_w-cell_x*6,timer_h,"Day: " +string(day))
	draw_text(cell_x*15,timer_h,"DayLight  " +string(THESUN.light[|eLight.Intensity]))
	draw_text(cell_x*15,timer_h+25,"DayDirection " +string(THESUN.light[|eLight.Direction]))
	draw_text(cell_x*15,timer_h+50,"DayShadow " +string(THESUN.light[|eLight.ShadowLength]))
	draw_text(cell_x*15,timer_h+75,"DayShadowIntense " +string(global.ambientShadowIntensity))
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
slot[1] = 0
switch (leftRight){
	case 0://Slot 1
	slot[0] = 0
	slot[1] = 1
	draw_sprite_ext(spr_quick_equipped,0,cell_x*2,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);		
	draw_sprite_ext(spr_quick_equip_frame,0,cell_x*2,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[0],cell_x*2-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
		//SLot 2
	draw_sprite_ext(spr_quick_equipped,1,cell_x*8,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);
	draw_sprite_ext(spr_quick_equip_frame,1,cell_x*8,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[1],cell_x*8-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
	break;
	case 1://Slot 1
	slot[0] = 1
	slot[1] = 0
	draw_sprite_ext(spr_quick_equipped,1,cell_x*2,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);
	draw_sprite_ext(spr_quick_equip_frame,0,cell_x*2,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[0],cell_x*2-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
		//Slot2
	draw_sprite_ext(spr_quick_equipped,0,cell_x*8,cell_y*50,equppied_scale,equppied_scale,0,c_white,1);
	draw_sprite_ext(spr_quick_equip_frame,1,cell_x*8,cell_y*50,frame_scale,frame_scale,0,c_white,1);
	draw_sprite_ext(spr_inventory,equipped[1],cell_x*8-(cell_x/2),cell_y*55,gun_scale,gun_scale,45,c_white,1);
	break;	
}
cell_slot_x = cell_x*21
cellx_buffer = cell_x*4.35
cell_slot_y = cell_y*23
celly_buffer = cell_y*8
gun_ybuffer = cell_y*5
if (InvOpen){
		draw_sprite_ext(spr_inventory_background,0,cell_x*20,cell_y*10,1.5,1,0,c_dkgrey,1);
var ii = 0;	
 for(var i = 0; i < invHeight; i++){
	for(var j = 0; j < invWidth; j++){
		
		switch(ii){
		case 0:
			draw_sprite_ext(spr_quick_equipped,slot[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i),equppied_scale*.80,equppied_scale*.80,0,c_white,1);
			draw_sprite_ext(spr_inventory,inventory[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i)+gun_ybuffer,gun_scale,gun_scale,45,c_white,1);
		break;
		case 1:
			draw_sprite_ext(spr_quick_equipped,slot[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i),equppied_scale*.80,equppied_scale*.80,0,c_white,1);
			draw_sprite_ext(spr_inventory,inventory[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i)+gun_ybuffer,gun_scale,gun_scale,45,c_white,1);
		break;
		case selected_slot:
			draw_sprite_ext(spr_inventory_slot_background,lockInv[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i),1,1,0,c_blue,1);
			draw_sprite_ext(spr_inventory,inventory[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i)+gun_ybuffer,gun_scale,gun_scale,45,c_white,1);
		break;
		case pickup_slot:
			draw_sprite_ext(spr_inventory_slot_background,lockInv[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i),1,1,0,c_blue,1);
			draw_sprite_ext(spr_inventory,inventory[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i)+gun_ybuffer,gun_scale,gun_scale,45,c_white,.2);
		break;
		
		default:
			draw_sprite_ext(spr_inventory_slot_background,lockInv[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i),1,1,0,c_white,1);
			draw_sprite_ext(spr_inventory,inventory[ii],cell_slot_x+(cellx_buffer*j),cell_slot_y+(celly_buffer*i)+gun_ybuffer,gun_scale,gun_scale,45,c_white,1);
		break;
		}
	ii++;
	} 
 }
 
if(pickup_slot != -1){
	draw_sprite_ext(spr_inventory,inventory[pickup_slot],mousex,mousey,gun_scale,gun_scale,45,c_white,1);
}
	
}










