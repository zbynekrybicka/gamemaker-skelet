/**
 * a_inst_step 1.0.0
 *
 * V rámci jednoho step posune instanci objektu daným směrem požadovanou rychlostí
 */
function inst_step(_target){
	var _dir = point_direction(x, y, _target.x, _target.y)
	x += lengthdir_x(patrolSpeed, _dir)
	y += lengthdir_y(patrolSpeed, _dir)
}


/**
 * a_inst_collision
 *
 * Testuje, zda se na místě objektu nachází cizí instance zvoleného objektu.
 */
function inst_collision(_object, _instance){
	return instance_place(x, y, _object) == _instance
}