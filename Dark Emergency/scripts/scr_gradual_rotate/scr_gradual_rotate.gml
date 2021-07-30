/// @function gradual_rotate(startAng,turnSpd,targAng);
/// @description Returns the startAng rotated towards the targAng by the turnSpd
/// @param {real} startAng The starting angle to rotate from
/// @param {real} turnSpd The speed (in degrees per step) to rotate towards the target angle
/// @param {real} targAng The target angle to rotate towards
function gradual_rotate(_startAng,_turnSpd,_targAng) {
	//correction
	if (_targAng > 360) {
		_targAng -= 360;
	}
	if (_targAng < 0) {
		_targAng += 360;
	}
	//correction
	var _anti = _targAng-_startAng;
	var _clock = _startAng+(360-_targAng);
	if (_anti < 0) {
		_anti += 360;
	}
	if (_clock > 360) {
		_clock -= 360;
	}
	//apply rotation
	if (_anti < _clock) {//anti-clockwise
	    if (_anti < _turnSpd) {
			_startAng = _targAng;
		}
	    else {
	        _startAng += _turnSpd;
	        if (_startAng > 360) {
				_startAng -= 360;
			}
	    }
	}
	else {//clockwise
	    if (_clock < _turnSpd) {
			_startAng = _targAng;
		}
	    else {
	        _startAng -= _turnSpd;
	        if (_startAng < 0) {
				_startAng += 360;
			}
	    }
	}
	return _startAng;
}