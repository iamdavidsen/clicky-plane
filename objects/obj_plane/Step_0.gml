if (global.game_state == game_states.running) {
	y_speed += falling_speed;

	y += y_speed;	
	
	if (y_speed > 10) {
		y_speed = 10;	
	}
}