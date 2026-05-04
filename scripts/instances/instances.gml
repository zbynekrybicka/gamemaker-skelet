/**
 * a_inst_step 1.1.0
 *
 * V rámci jednoho step posune instanci objektu daným směrem požadovanou rychlostí
 */
function inst_step(_target, _speed){
	var _dir = point_direction(x, y, _target.x, _target.y)
	x += lengthdir_x(_speed, _dir)
	y += lengthdir_y(_speed, _dir)
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