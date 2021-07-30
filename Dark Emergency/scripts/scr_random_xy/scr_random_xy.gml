/// @function random_xy(left,top,width,height,obstacle);
/// @description Find random coordinates that is free from obstacle, returned as rX and rY variables
/// @param {real} left The starting x to find random x
/// @param {real} top The starting y to find random y
/// @param {real} width The width from left to find random x
/// @param {real} height The height from top to find random y
/// @param {id} obstacle The [parent] object to avoid
function random_xy(_left,_top,_width,_height,_obstacle) {
	rX = _left+irandom(_width);
	rY = _top+irandom(_height);
	while (place_meeting(rX,rY,_obstacle)) {
		show_debug_message("finding new loc");
		rX = _left+irandom(_width);
		rY = _top+irandom(_height);
	}
}