/// @description Insert description here
// You can write your code in this editor
if (inventory24){
	max_items = 24	
}else if (inventory16){
	max_items = 16	
}
inventory[24] = 0
for(var i = 0; i < max_items;i++){
	lockInv[i] = 0	
}
equipped[0] = inventory[0];
equipped[1] = inventory[1];




if (leftRight){
	global.use = equipped[1]	
}else if (!leftRight){
	global.use = equipped[0]
}


if (count_up == true){
	seconds += (delta_time/1000000)*time_multply
	dayseconds += (delta_time/1000000)*time_multply
}
if (seconds >= 60 and seconds >= 59.9){
		seconds = 0;
		minutes++;
		dayseconds = 0;
}
if (minutes == 60){
	minutes = 0;
	hours++;
}
if (hours = 24){
	seconds = 0
	minutes = 0
	hours = 0
	day++;

	
}
keyInv = keyboard_check_pressed(vk_tab);
if (keyInv){
	InvOpen = !InvOpen	
}

if (InvOpen){
	mousex = device_mouse_x_to_gui(0);	
	mousey = device_mouse_y_to_gui(0);
	var i_mousex = mousex - cell_slot_x 
	var i_mousey = mousey - cell_slot_y

	var nx = i_mousex div cellx_buffer
	var ny = i_mousey div celly_buffer
	if (nx >= 0 and nx < invWidth) and (ny >= 0 and ny < invHeight){
		mouse_slotX = nx
		mouse_slotY = ny
	}
	
	//set selected slot
	selected_slot = min(max_items, mouse_slotX + (mouse_slotY*invWidth));
	//PickUp Item

	var ss_item = inventory[selected_slot];
	
	
	
	if (pickup_slot != -1){
		if (mouse_check_button_pressed(mb_left)){
			if (ss_item == Items.nothing){
				inventory[selected_slot] = inventory[pickup_slot]
				inventory[pickup_slot] = 0
				
				pickup_slot = -1;
			}else if (ss_item == pickup_slot){
				 pickup_slot = -1
			}else if (ss_item != pickup_slot){
				inventory[selected_slot] = inventory[pickup_slot]	
				inventory[pickup_slot] = ss_item
			}
		}
	}else if (ss_item != 0){
		// Dropping Item
		if (mouse_check_button_pressed(mb_right)){
			inventory[selected_slot] = 0;	
			// create objects to drop
			var inst = instance_create_layer(obj_player.x,obj_player.y,"player",obj_item)
			inst.image_index = ss_item; 
		}
		if (mouse_check_button_pressed(mb_left)){
			pickup_slot = selected_slot;
		}
	}
	
	
	
	
}





