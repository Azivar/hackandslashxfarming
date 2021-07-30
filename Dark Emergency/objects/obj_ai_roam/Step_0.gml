/// @description AI
if (obj_player.fireing > 0){
	vision = 0	
}else {
	vision = 2	
}
#region Set state (roam or attack)
var _rot = false;
if (leftRight == true) {
	var _sightAng = direction;
}
else {
	var _sightAng = angle;
}
var _len = point_distance(x,y,x+losXOffset,y+losYOffset);
var _dir = point_direction(x,y,x+losXOffset,y+losYOffset);
var _xx = x+lengthdir_x(_len,_dir+_sightAng);
var _yy = y+lengthdir_y(_len,_dir+_sightAng);
var _losDir = point_direction(_xx,_yy,target.x,target.y);
//check vision && line of sight to target
switch (vision) {
	case 0://360 sight
		var _vision = collision_circle(x,y,sight,target,1,1) && (!collision_rectangle_rotated(_xx,_yy,0,-(losWidth/2),point_distance(_xx,_yy,target.x,target.y),losWidth/2,_losDir,obstacle));
	break;
	case 1://rectangle sight
		var _vision = collision_rectangle_rotated(x,y,0,-visionRectWidth,sight,visionRectWidth,_sightAng,target) && (!collision_rectangle_rotated(_xx,_yy,0,-(losWidth/2),point_distance(_xx,_yy,target.x,target.y),losWidth/2,_losDir,obstacle));
	break;
	break;
	case 2://cone sight
		var _vision = rectangle_in_triangle(target.bbox_left,target.bbox_top,target.bbox_right,target.bbox_bottom,x,y,x+lengthdir_x(sight,_sightAng-visionConeAngle),y+lengthdir_y(sight,_sightAng-visionConeAngle),x+lengthdir_x(sight,_sightAng+visionConeAngle),y+lengthdir_y(sight,_sightAng+visionConeAngle))
		&& (!collision_rectangle_rotated(_xx,_yy,0,-(losWidth/2),point_distance(_xx,_yy,target.x,target.y),losWidth/2,_losDir,obstacle));
	break;
}
if (_vision) {
	roam = false;
	alarm[1] = rememberTargetTime;//roam delay
}
else if (alarm[1] < 0) {
	roam = true;
}
#endregion

#region Roam or attack
if (roam == true) {
	feetIndex += feetAnimateSpd;
    //roam around
    if (rX > x-spd && rX < x+spd && rY > y-spd && rY < y+spd) {
		var _cellSize = 48;
        random_xy(1,1,(floor(room_width/_cellSize)*_cellSize)-2,(floor(room_height/_cellSize)*_cellSize)-2,obstacle);
        mp_grid_path(global.aiGrid,path,x,y,rX,rY,1);
        path_start(path,spd,path_action_stop,0);
    }
	_rot = true;
}
else {
	path_end();//stop roaming path
    //attack target
    if (collision_circle(x,y,range,target,true,true)){//&& (!collision_rectangle_rotated(_xx,_yy,0,-(losWidth/2),point_distance(_xx,_yy,target.x,target.y),losWidth/2,_sightAng,obstacle))) {
		if (sprite_index != attackSprite) {
			sprite_index = attackSprite;
			image_index = 0;
			image_speed = attackAnimateSpd;
		}
		if (leftRight == false) {
			angle = gradual_rotate(angle,turnSpd,point_direction(x,y,target.x,target.y));
		}
		else {
			direction = point_direction(x,y,target.x,target.y);
		}
		feetIndex = 0;
        if (alarm[0] < 0) {//change to your attack code here---------------------------
			with(instance_create_layer(x,y,_layer,obj_slash)){
				speed = 10
				image_angle = other.direction
				direction = other.direction
				creator = other.id
			}
            alarm[0] = attackDelay;
        }
    }
    else {
		if (sprite_index != walkSprite) {
			sprite_index = walkSprite;
			image_index = 0;
			image_speed = walkAnimateSpd;
		}
		mp_potential_step_object(target.x,target.y,spd,obstacle);//move towards target
		feetIndex += feetAnimateSpd;
		if (collision_rectangle(bbox_left-1,bbox_top-1,bbox_right+1,bbox_bottom+1,obstacle,false,true) && abs(angle_difference(angle,direction)) < turnSpd*2) {
			//don't rotate (stops jittering against walls)
		}
		else {
			angle = gradual_rotate(angle,turnSpd,direction);
		}
	}
    //make sure a new random location will be calculated when the enemy goes back to roam
    rX = x;
    rY = y;
}
#endregion

//rotate
if (leftRight == false) {
	if (_rot) {
		angle = gradual_rotate(angle,turnSpd,direction);
	}
}
else {
	if (direction >= 90 && direction <= 270) {//left
		if (image_xscale != -1) {
			image_xscale = -1;
		}
	}
	else if (image_xscale != 1) {
		image_xscale = 1;
	}
}
if (hp <= 0){
	XP+=10;
	instance_destroy();
}