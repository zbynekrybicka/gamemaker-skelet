# GameMaker Skelet
## m_grid_move 1.0.0
<p>Posunuje instanci na zvolenou pozici na mřížce. Určené pouze pro inkrementaci a dekrementaci aktuální polohy, v případě skoků jde instance vzdušnou čarou.<br />
Ve snaze zabránit odchylkám to funguje tak, že pokud je vzdálenost vyšší než počet pixelů, které instance urazí za step, posune se o svoji rychlost, pokud je vzdálenost menší ale ne nulová, posune se pouze o tu vzdálenost.</p>

```javascript
function grid_move() {
	if (!is_real_position()) {
		var _target = grid_move_target()
		show_debug_message(_target)
		var _distance = math_distance(_target)
		if (_distance >= gridSpeed) {
			inst_step(_target, gridSpeed)
		} else if (_distance > 0) {
			inst_step(_target, _distance)
		} else {
			set_real_position()
		}
	}
}
```
## a_grid_move_target 1.0.0
<p>Vrací pozici na mřížce v pixelech. Očekává proměnné gridX, gridY a gridSize</p>

```javascript
function grid_move_target() 
```
## a_set_real_position 1.0.0
<p>Nastaví realGrid na požadovaný grid, což je potvrzení, že instance dorazila do cíle</p>

```javascript
function set_real_position() 
```
## a_is_real_position
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
## a_math_inc 1.0.0
<p>Vrací inkrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu max, vrátí hodnotu min.</p>

```javascript
function math_inc(_value, _max = 0, _min = 0) 

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
