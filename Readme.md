# GameMaker Skelet
## m_grid_control_left_side 1.0.0
<p>Vlevo vbok</p>

```javascript
function grid_control_left_side() {
	if (is_real_position()) {
		gridDirection = math_inc(gridDirection, 3, 0)
		on_grid_control_left()
	}
}
```
## m_grid_control_right_side 1.0.0
<p>Vpravo vbok</p>

```javascript
function grid_control_right_side() {
	if (is_real_position()) {
		gridDirection = math_dec(gridDirection, 0, 3)
		on_grid_control_right()
	}
}
```
## m_grid_control_about_face 1.0.0
<p>Čelem vzad</p>

```javascript
function grid_control_about_face() {
	if (is_real_position()) {
		gridDirection = math_inc(gridDirection, 3, 0)
		gridDirection = math_inc(gridDirection, 3, 0)
		on_grid_control_about()
	}
}
```
## m_grid_control_step_forward 1.0.1
<p>Krok vpřed</p>

```javascript
function grid_control_step_forward() {
	if (is_real_position()) {
		
		var _position = get_forward_position(gridDirection, gridX, gridY)
		gridX = _position.x
		gridY = _position.y
		
		on_grid_control_step_begin()
	}
}
```
## a_get_forward_position
<p>Na základě souřadnic v mřížce a směru vrátí souřadnice následujícího kroku</p>

```javascript
function get_forward_position(_direction, _x, _y) 
```
## m_get_forward_item
<p>Zjistí, zda se na souřadnicích před objektem nachází instance daného objektu</p>

```javascript
function get_forward_item(_object) {
	
	var _position = get_forward_position(gridDirection, gridX, gridY)
	
	var _target = grid_move_target(_position.x, _position.y)
	
	return place_meeting(_target.x, _target.y, _object)
}
```
## m_grid_move 1.0.1
<p>Posunuje instanci na zvolenou pozici na mřížce. Určené pouze pro inkrementaci a dekrementaci aktuální polohy, v případě skoků jde instance vzdušnou čarou.<br />
Ve snaze zabránit odchylkám to funguje tak, že pokud je vzdálenost vyšší než počet pixelů, které instance urazí za step, posune se o svoji rychlost, pokud je vzdálenost menší ale ne nulová, posune se pouze o tu vzdálenost.</p>

```javascript
function grid_move() {
	
	if (!is_real_position()) {
		
		var _target = grid_move_target(gridX, gridY)
		
		var _distance = math_distance(_target)		
		if (_distance > 0) {

			inst_step_to(_target, gridSpeed, _distance)

		} else {
		
			set_real_position()
			
			on_grid_control_step_end()
		}
	}
}
```
## a_grid_move_target 1.0.1
<p>Vrací pozici na mřížce v pixelech</p>

```javascript
function grid_move_target(_x, _y) 
```
## a_set_real_position 1.0.0
<p>Nastaví realGrid na požadovaný grid, což je potvrzení, že instance dorazila do cíle</p>

```javascript
function set_real_position() 
```
## a_is_real_position 1.0.0
<p>Testuje, zda realGrid souhlasí s požadovaným grid</p>

```javascript
function is_real_position() 
```
## m_inst_step 1.2.0
<p>V rámci jednoho step posune instanci objektu směrem k cíli požadovanou rychlostí</p>

```javascript
function inst_step(_target, _speed){
	
	var _position = { x, y }
	var _dir = math_direction(_position, _target)
	
	inst_step_in_direction(_speed, _dir)
}
```
## a_inst_step_in_direction 1.0.0
<p>V rámci jednoho step posune instanci objektu daným směrem požadovanou rychlostí</p>

```javascript
function inst_step_in_direction(_speed, _dir) 
```
## m_inst_step_to 1.0.0
<p>V rámci jednoho step posune instanci objektu smerem k požadovanému cíli a to buď maximální rychlostí nebo o zbývající vzdálenost</p>

```javascript
function inst_step_to(_target, _speed, _distance) {
	if (_speed < _distance) {
		inst_step(_target, _speed)
	} else {
		inst_step(_target, _distance)
	}
}
```
## a_inst_collision 1.0.0
<p>Testuje, zda se na místě objektu nachází cizí instance zvoleného objektu.</p>

```javascript
function inst_collision(_object, _instance)
```
## a_inst_move 1.0.0
<p>Přesune instanci na zvolenou pozici</p>

```javascript
function inst_move(_target) 
```
## m_kinetic_step 1.0.0
<p>Posune instanci o rychlost horizontálním a vertikálním směrem</p>

```javascript
function kinetic_step() {
	var _target = kinetic_next_step()
	inst_move(_target)
}
```
## a_kinetic_next_step 1.0.0
<p>Vrátí plánovanou pozici instance v příštím snímku</p>

```javascript
function kinetic_next_step() 
```
## m_kinetic_current_angle 1.0.0
<p>Vrací aktuální směr pohybu instance</p>

```javascript
function kinetic_current_angle() {
	var _position = { x, y }
	var _target = kinetic_next_step()
	return math_direction(_position, _target)
}
```
## m_kinetic_is_next_up 1.0.0
<p>Vrátí, zda předokládaná kolize je směrem nahoru</p>

```javascript
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
```
## m_kinetic_is_next_down 1.0.0
<p>Vrátí, zda předokládaná kolize je směrem dolů</p>

```javascript
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
```
## m_kinetic_is_next_right
<p>Vrátí, zda předokládaná kolize je směrem doprava</p>

```javascript
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
```
## m_kinetic_is_next_left
<p>Vrátí, zda předokládaná kolize je směrem doleva</p>

```javascript
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
```
## m_kinetic_next_collision 1.0.0
<p>Vrací instanci objektu, se kterou se instance v příštím kroce srazí</p>

```javascript
function kinetic_next_collision(_object) {
	var _target = kinetic_next_step()
	return instance_place(_target.x, _target.y, _object)
}
```
## a_kinetic_gravity 1.0.0
<p>Zvýší vertikální kinetickou energii o gravitační zrychlení</p>

```javascript
function kinetic_gravity(_g) 
```
## a_kinetic_fire 1.0.0
<p>Vystřelí instanci směrem a silou podle stanoveného vektoru</p>

```javascript
function kinetic_fire(_speed, _angle) 
```
## a_kinetic_fire_relative 1.0.0
<p>Změní kinetickou energii podle stanoveného vektoru</p>

```javascript
function kinetic_fire_relative(_speed, _angle) 
```
## a_math_inc 1.0.1
<p>Vrací inkrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu max, vrátí hodnotu min.</p>

```javascript
function math_inc(_value, _max = 0, _min = 0) 

```
## a_math_dec 1.0.0
<p>Vrací dekrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu min, vrátí hodnotu max.</p>

```javascript
function math_dec(_value, _min = 0, _max = 0) 
```
## a_math_distance 1.0.0
<p>Vrací vzdálenost instance od určeného cíle</p>

```javascript
function math_distance(_target) 
```
## a_math_direction 1.0.0
<p>Vrací směr pohledu z bodu A do budu B</p>

```javascript
function math_direction(_target1, _target2) 
```
## m_npc_patrol 1.0.0
<p>V rámci jednoho step provádí obsluhu patrolujícího NPC.</p>

```javascript
function npc_patrol(){
	var _target = targets[targetIndex]
	
	var _distance = math_distance(_target)
	if (_distance > 0) {
	
		inst_step_to(_target, patrolSpeed, _distance)
	
	} else {
	
		var _targetsLength = array_length(targets)
		targetIndex = math_inc(targetIndex, _targetsLength - 1, 0)

	}
}
```
