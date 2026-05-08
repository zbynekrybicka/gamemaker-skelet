/**
 * m_kinetic_step 1.0.0
 *
 * Posune instanci o rychlost horizontálním a vertikálním směrem
 */
function kinetic_step() {
	var _target = kinetic_next_step()
	inst_move(_target)
}


/**
 * a_kinetic_next_step 1.0.0
 *
 * Vrátí plánovanou pozici instance v příštím snímku
 */
function kinetic_next_step() {
	return { x: x + hsp, y: y + vsp }
}


/**
 * m_kinetic_current_angle 1.0.0
 *
 * Vrací aktuální směr pohybu instance
 */
function kinetic_current_angle() {
	var _position = { x, y }
	var _target = kinetic_next_step()
	return math_direction(_position, _target)
}


/**
 * m_kinetic_is_next_up 1.0.0
 *
 * Vrátí, zda předokládaná kolize je směrem nahoru
 */
function kinetic_is_next_collision_up(_object, _more = 0) {
	
	var _target = kinetic_next_step()
	
	var _instance = instance_place(x, _target.y - _more, _object)
	if (!_instance) {
		return infinity
	}
	_instance = instance_place(_instance.x, _target.y - _more, _object)
	var _distance = distance_to_object(_instance)
	
	var _isUp = _target.y <= y
	return _isUp ? _distance : infinity
}


/**
 * m_kinetic_is_next_down 1.0.0
 *
 * Vrátí, zda předokládaná kolize je směrem dolů
 */
function kinetic_is_next_collision_down(_object, _more = 0) {
	
	var _target = kinetic_next_step()
	
	var _instance = instance_place(x, _target.y + _more, _object)
	if (!_instance) {
		return infinity
	}
	_instance = instance_place(_instance.x, _target.y + _more, _object)
	var _distance = distance_to_object(_instance)
	
	var _isDown = _target.y >= y
	return _isDown ? _distance : infinity
}


/**
 * m_kinetic_is_next_right
 *
 * Vrátí, zda předokládaná kolize je směrem doprava
 */
function kinetic_is_next_collision_right(_object, _more = 0) {
	
	var _target = kinetic_next_step()
	
	var _instance = instance_place(_target.x + _more, y, _object)
	if (!_instance) {
		return infinity
	}
	_instance = instance_place(_target.x + _more, _instance.y, _object)
	var _distance = distance_to_object(_instance)
	var _isRight = _target.x >= x
	return _isRight ? _distance : infinity
}


/**
 * m_kinetic_is_next_left
 *
 * Vrátí, zda předokládaná kolize je směrem doleva
 */
function kinetic_is_next_collision_left(_object, _more = 0) {
	
	var _target = kinetic_next_step()
	
	var _instance = instance_place(_target.x - _more, y, _object)
	if (!_instance) {
		return infinity
	}
	_instance = instance_place(_target.x - _more, _instance.y, _object)
	var _distance = distance_to_object(_instance)
	var _isLeft = _target.x <= x
	return _isLeft ? _distance : infinity
}

/**
 * m_kinetic_collision_horizontal 1.0.0
 *
 * Zastavení pohybu horizontálním směrem o překážku
 */
function kinetic_collision_horizontal() {
	var _distRight = kinetic_is_next_collision_right(Kinetic_platform, 1)
	if (_distRight < infinity) {
		if (_distRight < 1) {
			hsp = 0
		} else {
			hsp = _distRight - 1
		}
	}
	var _distLeft = kinetic_is_next_collision_left(Kinetic_platform, 1)
	if (_distLeft < infinity) {
		if (_distLeft < 1) {
			hsp = 0
		} else {
			hsp = -(_distLeft - 1)
		}
	}
}


/**
 * m_kinetic_collision_up 1.0.0
 *
 * Zastavení stoupání o strop
 */
function kinetic_collision_up() {
	var _distUp = kinetic_is_next_collision_up(Kinetic_platform)
	if (_distUp < infinity) {
		vsp = 0
	} 
}


/**
 * m_kinetic_collision_down 1.0.0
 *
 * Volný pád a zastavení o překážku směrem dolů včetně pružnosti a tření
 */
function kinetic_collision_down(_gravity, _springiness = 0, _friction = 1) {
	var _distDown = kinetic_is_next_collision_down(Kinetic_platform, 0.5)
	if (_distDown < infinity) {
		hsp *= _friction

		if (vsp > 1) {
			vsp = vsp * _springiness
			if (vsp > 1) {
				vsp = -vsp
				return
			}
		}
		
		if (_distDown < _gravity) {
			vsp = 0
		}
	} else {
		kinetic_gravity(_gravity)
	}
}




/**
 * m_kinetic_next_collision 1.0.0
 *
 * Vrací instanci objektu, se kterou se instance v příštím kroce srazí
 */
function kinetic_next_collision(_object) {
	var _target = kinetic_next_step()
	return instance_place(_target.x, _target.y, _object)
}


/**
 * a_kinetic_gravity 1.0.0
 *
 * Zvýší vertikální kinetickou energii o gravitační zrychlení
 */
function kinetic_gravity(_g) {
	vsp += _g
}


/**
 * a_kinetic_fire 1.0.0
 *
 * Vystřelí instanci směrem a silou podle stanoveného vektoru
 */
function kinetic_fire(_speed, _angle) {
	hsp = lengthdir_x(_speed, _angle)
	vsp = lengthdir_y(_speed, _angle)
}


/**
 * a_kinetic_fire_relative 1.0.0
 *
 * Změní kinetickou energii podle stanoveného vektoru
 */
function kinetic_fire_relative(_speed, _angle) {
	hsp += lengthdir_x(_speed, _angle)
	vsp += lengthdir_y(_speed, _angle)
}