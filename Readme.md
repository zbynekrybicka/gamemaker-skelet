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
## a_inst_step 1.1.0
<p>V rámci jednoho step posune instanci objektu daným směrem požadovanou rychlostí</p>

```javascript
function inst_step(_target, _speed)
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
## m_npc_patrol 1.0.0
<p>V rámci jednoho step provádí obsluhu patrolujícího NPC.</p>

```javascript
function npc_patrol(){
	var _target = instance_find(patrolPoint, targetIndex)
	
	var _isCollision = inst_collision(PatrolPoint, _target)
	if (_isCollision) {
		
		var _overflow = instance_number(patrolPoint) - 1
		targetIndex = math_inc(targetIndex, _overflow)
	}
	inst_step(_target, patrolSpeed)

}
```
