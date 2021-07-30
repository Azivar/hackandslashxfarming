/// @function draw_rectangle_rotated(x,y,x1,y1,x2,y2,rotation,outline);
/// @description Draw rectangle primitive rotated
/// @param {real} x The origin x
/// @param {real} y The origin y
/// @param {real} x1 The x offset from origin x for top left
/// @param {real} y1 The y offset from origin x for top left
/// @param {real} x2 The x offset from origin x for bottom right
/// @param {real} y2 The y offset from origin x for bottom right
/// @param {real} rotation The angle the rectangle is rotated to
/// @param {bool} outline Whether to draw rectangle as an outline (true) or filled (false)
function draw_rectangle_rotated(_cx,_cy,_xx1,_yy1,_xx2,_yy2,_rot,_outline) {
	var _sxx = cos(degtorad(_rot));
	var _sxy = -sin(degtorad(_rot));
	var _syx = sin(degtorad(_rot));
	var _syy = cos(degtorad(_rot));

	var _x1 = _cx+_sxx*_xx1+_syx*_yy1;
	var _x2 = _cx+_sxx*_xx2+_syx*_yy1;
	var _x3 = _cx+_sxx*_xx2+_syx*_yy2;
	var _x4 = _cx+_sxx*_xx1+_syx*_yy2;

	var _y1 = _cy+_sxy*_xx1+_syy*_yy1;
	var _y2 = _cy+_sxy*_xx2+_syy*_yy1;
	var _y3 = _cy+_sxy*_xx2+_syy*_yy2;
	var _y4 = _cy+_sxy*_xx1+_syy*_yy2;

	if (_outline) {
	    draw_line(_x1,_y1,_x4,_y4);
	    draw_line(_x2,_y2,_x1,_y1);
	    draw_line(_x3,_y3,_x2,_y2);
	    draw_line(_x4,_y4,_x3,_y3);
	}
	else {
	    draw_triangle(_x1,_y1,_x2,_y2,_x3,_y3,false);
	    draw_triangle(_x1,_y1,_x3,_y3,_x4,_y4,false);
	}
}
/// @function collision_rectangle_rotated(x,y,x1,y1,x2,y2,rotation,object);
/// @description Uses x1,y1,x2,y2 to define an area originating from x,y in the room and rotated by rotation then checks to see if object is in collision with that area
/// @param {real} x The origin x
/// @param {real} y The origin y
/// @param {real} x1 The x offset from origin x for top left
/// @param {real} y1 The y offset from origin y for top left
/// @param {real} x2 The x offset from origin x for bottom right
/// @param {real} y2 The y offset from origin y for bottom right
/// @param {real} rotation The angle the rectangle is rotated to
/// @param {id} object The object to check collision with rectangle rotated
function collision_rectangle_rotated(_cx,_cy,_xx1,_yy1,_xx2,_yy2,_rot,_object) {
	var _sxx = cos(degtorad(_rot));
	var _sxy = -sin(degtorad(_rot));
	var _syx = sin(degtorad(_rot));
	var _syy = cos(degtorad(_rot));

	var _x1 = _cx+_sxx*_xx1+_syx*_yy1;
	var _x2 = _cx+_sxx*_xx2+_syx*_yy1;
	var _x3 = _cx+_sxx*_xx2+_syx*_yy2;
	var _x4 = _cx+_sxx*_xx1+_syx*_yy2;

	var _y1 = _cy+_sxy*_xx1+_syy*_yy1;
	var _y2 = _cy+_sxy*_xx2+_syy*_yy1;
	var _y3 = _cy+_sxy*_xx2+_syy*_yy2;
	var _y4 = _cy+_sxy*_xx1+_syy*_yy2;
	
	var _biggestSide = max(abs(_xx1),abs(_yy1),abs(_xx2),abs(_yy2));
	var _objectsList = ds_list_create();
	var _n = collision_rectangle_list(_cx-_biggestSide,_cy-_biggestSide,_cx+_biggestSide,_cy+_biggestSide,_object,false,true,_objectsList,false);
	if (_n > 0) {
		for (var _i=0; _i<_n; _i++) {
			if (rectangle_in_triangle(_objectsList[| _i].bbox_left,_objectsList[| _i].bbox_top,_objectsList[| _i].bbox_right,_objectsList[| _i].bbox_bottom,_x1,_y1,_x2,_y2,_x3,_y3)
			|| rectangle_in_triangle(_objectsList[| _i].bbox_left,_objectsList[| _i].bbox_top,_objectsList[| _i].bbox_right,_objectsList[| _i].bbox_bottom,_x1,_y1,_x3,_y3,_x4,_y4)) {
				ds_list_destroy(_objectsList);
				return true;
			}
		}
	}
	ds_list_destroy(_objectsList);
	return false;
}