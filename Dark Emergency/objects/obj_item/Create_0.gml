/// @description Insert description here
// You can write your code in this editor
image_index = irandom(Items.height-1)
size = .15
image_xscale = size
image_yscale = size
image_speed = 0
image_angle = irandom(359);
drop_move = true
var dir = irandom(359);
var len = 300

goal_x = x + lengthdir_x(len,dir)
goal_y = y + lengthdir_y(len,dir)