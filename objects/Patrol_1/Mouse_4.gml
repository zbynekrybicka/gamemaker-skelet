if (pauseStepRemains == 0) {
	
	pauseStepRemains = 60*3
	
	global.player_score += 1
	
	window_set_caption("Skelet - " + string(global.player_score))
}