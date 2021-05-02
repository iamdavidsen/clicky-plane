x = room_width / 2;
y = room_height - 92;

randomize();

enum game_states {
	not_started,
	running,
	game_over
}

function end_game() {
	if (global.game_state != game_states.game_over) {
		global.game_state = game_states.game_over;
	
		audio_play_sound(hurt, 1, 0);
		
		if (score > global.highscore) {
			global.highscore = score;
			
			obj_highscore_controller.save_new_highscore();
		}
	}
}

function evalute_word() {
	var a = string(chr(keyboard_key));
	
	var keyboard_char = string_lower(a);

	var current_word = ds_map_find_value(global.current_text_sequence, "word");
	var current_char =  string_lower(string_char_at(current_word, global.current_text_index));

	
	var success = false;
	
	if (keyboard_char == current_char) {
		success = true;
		
		play_random_sound([typing_sound_1, typing_sound_2, typing_sound_3],1);
		with (obj_plane) {
			jump();	
		}
		
		if (global.current_text_index == string_length(current_word)) {
			remove_sequence(global.current_text_sequence);
			new_word();
		} else {
			global.current_text_index++;
		}
		
		return success;
	}
}

function new_word() {
	create_sequence(room_width / 2, room_height - 64);
}

global.game_state = game_states.not_started;
global.current_text_sequence = -1;
global.current_text_index = -1;
global.game_speed = game_speed;
score = 0;

words = get_words();
sequences = ds_list_create();

background_x = 0;

new_word();