/// @description Insert description here
// You can write your code in this editor
if (inventory24){
	max_items = 24	
}else if (inventory16){
	max_items = 16	
}
if (leftRight){
	global.use = equipped[1]	
}else if (!leftRight){
	global.use = equipped[0]
}


if (count_up == true){
	seconds += (delta_time/1000000)*time_multply
	totalSeconds += (delta_time/1000000)*time_multply
}
if (seconds >= 60 and seconds >= 59.9){
		seconds = 0;
		minutes++;
}
if (minutes == 60){
	minutes = 0;
	hours++;
}
if (hours = 24){
	totalSeconds = 0
	seconds = 0
	minutes = 0
	hours = 0
	day++;
}
global.daytime = 0


if (totalSeconds < 43200){
	daylight += (delta_time/1000000)*time_multply
	if (daylight > 14401){
		global.daytime	= (daylight - 14400)/10000
	}
}else if (totalSeconds > 43200){
	daylight -= (delta_time/1000000)*time_multply
	if (daylight > 14401 ){
		global.daytime	= ((daylight - 14400)/10000)
	}
}







