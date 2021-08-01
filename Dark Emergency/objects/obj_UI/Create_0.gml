/// @description Insert description here
// You can write your code in this editor
globalvar XP;
globalvar play_health;
globalvar play_stamina;
globalvar seconds;
globalvar minutes;
globalvar hours;
globalvar day;
count_up = true
day = 0
hours = 5
minutes = 0
seconds = 0
play_stamina = 100;
play_health = 20;
XP = 0;
_width = display_get_gui_width()
_height = display_get_gui_height()

cell_x = _width/64
cell_y = _height/64
pickup_slot = -1;
selected_slot = 0;

keyQ = false
InvOpen = false
inventory16 = false
inventory24 = false
leftRight = false
global.use = 0
globalvar max_items;
globalvar max_equipped;
globalvar inventory;
globalvar dayseconds;
dayseconds = 0;
max_items = 8
inventory[max_items] = 0;
max_equipped = 1;
max_items = 8;
globalvar equipped;
equipped[max_equipped] = 0;
lockInv[24] = 1;
for(var i = 0; i < 24;i++){
	lockInv[i] = 1
}
inventory[0] = 6
inventory[1] = 7
inventory[2] = 8
inventory[3] = 9
inventory[4] = 10

mouse_slotX = 0
mouse_slotY = 0
slot[1] = 0  

invHeight = 3
invWidth = 8
time_multply = 60


timer_w = cell_x*56
timer_h = cell_y*2
