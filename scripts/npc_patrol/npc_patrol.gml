/**
 * m_npc_patrol 1.0.0
 *
 * V rámci jednoho step provádí obsluhu patrolujícího NPC.
 */
function npc_patrol(){
	var _target = instance_find(patrolPoint, targetIndex)
	
	var _isCollision = inst_collision(PatrolPoint, _target)
	if (_isCollision) {
		
		var _overflow = instance_number(patrolPoint) - 1
		targetIndex = math_inc(targetIndex, _overflow)
	}
	inst_step(_target)

}