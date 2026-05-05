realGridX = gridX
realGridY = gridY


_set_sprite = function() {
	switch (gridDirection) {
		case 0:
			sprite_index = Arrow_right
			break
		case 1:
			sprite_index = Arrow_up
			break
		case 2:
			sprite_index = Arrow_left
			break
		case 3:
			sprite_index = Arrow_down
			break
	}
}
_set_sprite()

on_grid_control_left = function() {
	_set_sprite()
}

on_grid_control_right = function() {
	_set_sprite()
}

on_grid_control_about = function() {
	_set_sprite()
}

on_grid_control_step_begin = function() {

}

on_grid_control_step_end = function() {

}

