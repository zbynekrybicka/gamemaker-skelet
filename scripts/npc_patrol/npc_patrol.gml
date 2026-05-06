/**
 * m_npc_patrol 1.0.0
 *
 * V rámci jednoho step provádí obsluhu patrolujícího NPC.
 */
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