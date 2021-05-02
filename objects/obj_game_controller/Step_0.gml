if (global.game_state == game_states.running) {
	background_x -= game_speed * 0.25;
	layer_x("background",  background_x); 
}