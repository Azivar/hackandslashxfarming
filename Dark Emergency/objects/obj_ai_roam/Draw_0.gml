/// @description Draw
if (flash > 0){
	shader_set(shWhite)
	flash--;
}else {
	shader_reset();
}
if (feetSprite != -1) {
	draw_sprite_ext(feetSprite,feetIndex,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);
}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,angle,image_blend,image_alpha);

if (global.dbug == true) {
	draw_text(x,y,alarm[1]);//rememberTargetTime
	if (leftRight == true) {
		var _sightAng = direction;
	}
	else {
		var _sightAng = angle;
	}
    //sight
    switch (vision) {
		case 0://360 sight
	        if (collision_circle(x,y,sight,target,true,true)) {
				draw_set_color(c_lime);
			}
	        else {
				draw_set_color(c_red);
			}
	        draw_circle(x,y,sight,true);
		break;
		case 1://rectangle sight
			if (collision_rectangle_rotated(x,y,0,-visionRectWidth,sight,visionRectWidth,_sightAng,target)) {
				draw_set_color(c_lime);
			}
	        else {
				draw_set_color(c_red);
			}
			draw_rectangle_rotated(x,y,0,-visionRectWidth,sight,visionRectWidth,_sightAng,true);
		break;
		case 2://cone sight
	        if (point_in_triangle(target.x,target.y,x,y,x+lengthdir_x(sight,_sightAng-visionConeAngle),y+lengthdir_y(sight,_sightAng-visionConeAngle),x+lengthdir_x(sight,_sightAng+visionConeAngle),y+lengthdir_y(sight,_sightAng+visionConeAngle))) {
				draw_set_color(c_lime);
			}
	        else {
				draw_set_color(c_red);
			}
	        draw_triangle(x,y,x+lengthdir_x(sight,_sightAng-visionConeAngle),y+lengthdir_y(sight,_sightAng-visionConeAngle),x+lengthdir_x(sight,_sightAng+visionConeAngle),y+lengthdir_y(sight,_sightAng+visionConeAngle),true)
		break;
    }
    //line of sight
	if (draw_get_colour() == c_lime) {//meaning the target is within sight
		var _len = point_distance(x,y,x+losXOffset,y+losYOffset);
		var _dir = point_direction(x,y,x+losXOffset,y+losYOffset);
		var _xx = x+lengthdir_x(_len,_dir+_sightAng);
		var _yy = y+lengthdir_y(_len,_dir+_sightAng);
		var _losDir = point_direction(_xx,_yy,target.x,target.y);
		if (!collision_rectangle_rotated(_xx,_yy,0,-(losWidth/2),point_distance(_xx,_yy,target.x,target.y),losWidth/2,_losDir,obstacle)) {
			draw_set_color(c_lime);
		}
		else {
			draw_set_color(c_red);
		}
		draw_rectangle_rotated(_xx,_yy,0,-(losWidth/2),point_distance(_xx,_yy,target.x,target.y),losWidth/2,_losDir,true);
	}
	//range
    if (collision_circle(x,y,range,target,true,true)) {
		draw_set_color(c_lime);
	}
    else {
		draw_set_color(c_red);
	}
    draw_circle(x,y,range,true);
    //path
    if (roam == true) {
        draw_set_color(c_yellow);
        draw_path(path,x,y,true);
    }
}
shader_reset();