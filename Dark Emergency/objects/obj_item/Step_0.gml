/// @description Insert description here
// You can write your code in this editor
if(drop_move){
	x = lerp(x,goal_x,.5)
	y = lerp(y,goal_y,0.5)
	if (abs(x-goal_x) < 1 and abs (y - goal_y) < 1){
		drop_move = false;	
	}
}else {
	if (!keyboard_check(ord("E"))){
		var px = obj_player.x
		var py = obj_player.y
		var item = image_index
		if(point_in_circle(px,py,x,y,128)){
			//on top of player
			if(!point_in_circle(px,py,x,y,32)){
				x = lerp(x,px,.20)
				y = lerp(y,py,0.20)
			}else{
				with(obj_UI){
					var picked_up = false;
				var yy = 0; repeat(max_items){
						if (inventory[yy] == 0){
							inventory[yy] = item;
							picked_up = true;
							break;
						}else{
							yy++;	
						}	
					}
				}
				if(picked_up){
					instance_destroy();	
				}
			}
		}
	}	
}


