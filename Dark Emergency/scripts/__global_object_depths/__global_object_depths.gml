function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // cmdsys
	global.__objectDepths[1] = 0; // objfire4
	global.__objectDepths[2] = 0; // objfire3
	global.__objectDepths[3] = -1; // obj_weapon
	global.__objectDepths[4] = 0; // objfire1
	global.__objectDepths[5] = 0; // objfire2
	global.__objectDepths[6] = 0; // obj_buttonZ
	global.__objectDepths[7] = 0; // obj_buttonD
	global.__objectDepths[8] = 0; // obj_buttonS
	global.__objectDepths[9] = 0; // obj_buttonW
	global.__objectDepths[10] = 0; // obj_buttonI
	global.__objectDepths[11] = 0; // objfire5


	global.__objectNames[0] = "cmdsys";
	global.__objectNames[1] = "objfire4";
	global.__objectNames[2] = "objfire3";
	global.__objectNames[3] = "obj_weapon";
	global.__objectNames[4] = "objfire1";
	global.__objectNames[5] = "objfire2";
	global.__objectNames[6] = "obj_buttonZ";
	global.__objectNames[7] = "obj_buttonD";
	global.__objectNames[8] = "obj_buttonS";
	global.__objectNames[9] = "obj_buttonW";
	global.__objectNames[10] = "obj_buttonI";
	global.__objectNames[11] = "objfire5";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
