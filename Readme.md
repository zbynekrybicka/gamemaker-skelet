# GameMaker Skelet
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
## a_math_inc 1.0.0
<p>Vrací inkrementovanou hodnotu, pokud odpovídá limitům. Pokud výsledná hodnota překračuje hodnotu max, vrátí hodnotu min.</p>

```javascript
function math_inc(_value, _max = 0, _min = 0) 

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
