if (global.game_state == game_states.running) {
	x -= global.game_speed;

	if (x < -128) {
	 x += 128;	
	}
}