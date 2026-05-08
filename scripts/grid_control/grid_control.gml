/**
 * m_grid_control_left_side 1.0.0
 *
 * Vlevo vbok
 */
function grid_control_left_side() {
	if (is_real_position()) {
		gridDirection = math_inc(gridDirection, 3, 0)
		on_grid_control_left()
	}
}


/**
 * m_grid_control_right_side 1.0.0
 *
 * Vpravo vbok
 */
function grid_control_right_side() {
	if (is_real_position()) {
		gridDirection = math_dec(gridDirection, 0, 3)
		on_grid_control_right()
	}
}


/**
 * m_grid_control_about_face 1.0.0
 *
 * Čelem vzad
 */
function grid_control_about_face() {
	if (is_real_position()) {
		gridDirection = math_inc(gridDirection, 3, 0)
		gridDirection = math_inc(gridDirection, 3, 0)
		on_grid_control_about()
	}
}


/**
 * m_grid_control_step_forward 1.0.1
 *
 * Krok vpřed
 */
function grid_control_step_forward() {
	if (is_real_position()) {
		
		var _position = get_forward_position(gridDirection, gridX, gridY)
		gridX = _position.x
		gridY = _position.y
		
		on_grid_control_step_begin()
	}
}


/**
 * a_get_forward_position
 *
 * Na základě souřadnic v mřížce a směru vrátí souřadnice následujícího kroku
 */
function get_forward_position(_direction, _x, _y) {
	switch (_direction) {
		case 0: return { x: _x + 1, y: _y }
		case 1: return { x: _x, y: _y + 1 }
		case 2: return { x: _x - 1, y: _y }
		case 3: return { x: _x, y: _y - 1 }
		default: return { x: _x, y: _y }
	}
}


/**
 * m_get_forward_item
 *
 * Zjistí, zda se na souřadnicích před objektem nachází instance daného objektu
 */
function get_forward_item(_object) {
	
	var _position = get_forward_position(gridDirection, gridX, gridY)
	
	var _target = grid_move_target(_position.x, _position.y)
	
	return place_meeting(_target.x, _target.y, _object)
}


/**
 * a_grid_control_direction
 *
 * Nastaví směr, kterým se má instance otočit
 */
function grid_control_direction(_direction) {
	if (_direction >= 0 && _direction <= 3) {
		gridDirection = _direction
		on_grid_control_direction()
	}
}