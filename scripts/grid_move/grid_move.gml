/**
 * m_grid_move 1.0.1
 *
 * Posunuje instanci na zvolenou pozici na mřížce. Určené pouze pro inkrementaci a dekrementaci aktuální polohy, v případě skoků jde instance vzdušnou čarou.
 * Ve snaze zabránit odchylkám to funguje tak, že pokud je vzdálenost vyšší než počet pixelů, které instance urazí za step, posune se o svoji rychlost, pokud je vzdálenost menší ale ne nulová, posune se pouze o tu vzdálenost.
 */
function grid_move() {
	
	if (!is_real_position()) {
		
		var _target = grid_move_target(gridX, gridY)
		
		var _distance = math_distance(_target)
		
		if (_distance >= gridSpeed) {
			
			inst_step(_target, gridSpeed)
			
		} else if (_distance > 0) {
			
			inst_step(_target, _distance)
			
		} else {
			
			set_real_position()
			
			on_grid_control_step_end()
		}
	}
}


/**
 * a_grid_move_target 1.0.1
 *
 * Vrací pozici na mřížce v pixelech
 */
function grid_move_target(_x, _y) {
	return {
		x: _x * gridSize,
		y: gridHeight * gridSize - (_y + 1) * gridSize
	}
}



/**
 * a_set_real_position 1.0.0
 *
 * Nastaví realGrid na požadovaný grid, což je potvrzení, že instance dorazila do cíle
 */
function set_real_position() {
	realGridX = gridX
	realGridY = gridY
}


/**
 * a_is_real_position 1.0.0
 *
 * Testuje, zda realGrid souhlasí s požadovaným grid
 */
function is_real_position() {
	return realGridX == gridX && realGridY == gridY
}
