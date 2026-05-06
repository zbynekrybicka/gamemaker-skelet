var _distUp = kinetic_is_next_collision_up(Kinetic_platform)

if (_distUp < infinity) {
	vsp = 0
} 

var _distDown = kinetic_is_next_collision_down(Kinetic_platform, 1)
if (_distDown < infinity) {
	if (vsp > 1) {
		vsp = -vsp * 0.4
	} else if (_distDown < 0.5) {
		vsp = 0
	} else {
		vsp = _distDown - 0.5
	}
	hsp *= 0.93 
} else {
	kinetic_gravity(0.6)
}

var _isCollisionRight = kinetic_is_next_collision_right(Kinetic_platform, 1)
if (_isCollisionRight < infinity) {
	if (_isCollisionRight < 1) {
		hsp = 0
	} else {
		hsp = _isCollisionRight - 1
	}
}
var _isCollisionLeft = kinetic_is_next_collision_left(Kinetic_platform, 1)
if (_isCollisionLeft < infinity) {
	if (_isCollisionRight < 1) {
		hsp = 0
	} else {
		hsp = -_isCollisionLeft + 1
	}
}

kinetic_step()