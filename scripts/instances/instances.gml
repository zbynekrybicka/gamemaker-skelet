/**
 * m_inst_step 1.2.0
 *
 * V rámci jednoho step posune instanci objektu směrem k cíli požadovanou rychlostí
 */
function inst_step(_target, _speed){
	
	var _position = { x, y }
	var _dir = math_direction(_position, _target)
	
	inst_step_in_direction(_speed, _dir)
}


/**
 * a_inst_step_in_direction 1.0.0
 *
 * V rámci jednoho step posune instanci objektu daným směrem požadovanou rychlostí
 */
function inst_step_in_direction(_speed, _dir) {
	x += lengthdir_x(_speed, _dir)
	y += lengthdir_y(_speed, _dir)
}


/**
 * m_inst_step_to 1.0.0
 *
 * V rámci jednoho step posune instanci objektu smerem k požadovanému cíli a to buď maximální rychlostí nebo o zbývající vzdálenost
 */
function inst_step_to(_target, _speed, _distance) {
	if (_speed < _distance) {
		inst_step(_target, _speed)
	} else {
		inst_step(_target, _distance)
	}
}


/**
 * a_inst_collision 1.0.0
 *
 * Testuje, zda se na místě objektu nachází cizí instance zvoleného objektu.
 */
function inst_collision(_object, _instance){
	return instance_place(x, y, _object) == _instance
}


/**
 * a_inst_move 1.0.0
 *
 * Přesune instanci na zvolenou pozici
 */
function inst_move(_target) {
	x = _target.x
	y = _target.y
}