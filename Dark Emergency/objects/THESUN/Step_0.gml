/// @description Insert description here
// You can write your code in this editor
//Start at 4:30 change shadow length, intesity, and direction until 12 then reverse

if (hours >= 5)and (hours < 13){
	if (dayseconds mod 60 = 0){
		light[| eLight.Direction] -= .2;	
		light[| eLight.Intensity] += .01
		light[| eLight.ShadowLength] -= 1.66
	}
}else if (hours >= 13) and (hours < 21){
		if (dayseconds mod 60 = 0){
			light[| eLight.Direction] -= .2;	
			light[| eLight.Intensity] -= .01
			light[| eLight.ShadowLength] += 1.66
		} 
}else {
			light[| eLight.Direction] =	330
			light[| eLight.Intensity] = 0
}