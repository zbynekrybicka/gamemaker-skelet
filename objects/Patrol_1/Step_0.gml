var _state = "PATROL"

if (pauseStepRemains > 0) {
	_state = "PAUSE"
}


switch (_state) {
	case "PATROL": npc_patrol() break
	case "PAUSE": pauseStepRemains-- break
}
