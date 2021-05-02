switch(global.game_state) {
	case game_states.not_started:
		if (evalute_word()) {
			alarm[0] = room_speed * spawn_rate;
			global.game_state = game_states.running;
		}
		break;
		
	case game_states.running:
		evalute_word();
		break;
	case game_states.game_over:
		if (keyboard_key == vk_space) {
			room_restart();	
		}
		break;
}