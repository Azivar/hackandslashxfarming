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
hours = 0
minutes = 0
seconds = 0
play_stamina = 100;
play_health = 20;
XP = 0;
_width = display_get_gui_width()
_height = display_get_gui_height()

cell_x = _width/64
cell_y = _height/64

keyQ = false
InvOpen = false
inventory16 = false
inventory24 = false
leftRight = false
global.use = 0
globalvar max_items;
globalvar max_equipped;
globalvar inventory;
max_equipped = 1;
max_items = 8;
inventory[max_items] = 0;
globalvar equipped;
equipped[max_equipped] = 0;
equipped[0] = Items.PlasmaRifle;
equipped[1] = Items.MiniFun;
totalSeconds = 0
time_multply = 10
daylight = 0
global.daytime = 0

timer_w = cell_x*56
timer_h = cell_y*2
