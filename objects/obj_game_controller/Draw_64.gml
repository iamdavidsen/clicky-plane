shadow = 3;

draw_set_font(KenVector);

function draw_background() {
	var text_height = string_height("hello world");
	
	draw_set_color(make_color_rgb(0,0,0));
	draw_set_alpha(0.4);
	draw_rectangle(0, y - text_height / 2 - 8, room_width, y + text_height / 2 + 8, 0);
	draw_set_alpha(1);
}

function draw_score() {
		var score_y = 92;
	
		draw_set_halign(fa_center);
	
		draw_set_color(c_black);
		draw_text(x  + shadow, score_y + shadow, score);	
		
		draw_set_color(c_white);
		draw_text(x , score_y, score);	
}

function draw_current_text() {
	draw_set_valign(fa_center);
	if (global.current_text_sequence != -1) {
		var current_word =  ds_map_find_value(global.current_text_sequence, "word");
	
		//  Completed chars
		var before_current_char = string_copy(current_word, 1, global.current_text_index - 1);
	
		// Current Char
		var current_char = string_char_at(current_word, global.current_text_index);
	
	
		// Not completed char
		var after_current_char = string_copy(current_word, global.current_text_index + 1, string_length(current_word)  - global.current_text_index);
	
		var offset = 0;
		
		offset = string_width(current_char) / 2;
		draw_set_halign(fa_right);
		
		draw_set_color(c_black);
		draw_text(x - offset + shadow, y + shadow ,before_current_char);	
		
		draw_set_color(c_lime);
		draw_text(x - offset, y ,before_current_char);	
	
	
		offset = 0;
		draw_set_halign(fa_center);
		
		draw_set_color(c_black);
		draw_text(x - offset + shadow, y + shadow ,current_char);
		
		draw_set_color(c_yellow);
		draw_text(x - offset, y ,current_char);
		
		offset = string_width(current_char) / 2;
		draw_set_halign(fa_left);
		
		draw_set_color(c_black);
		draw_text(x + offset + shadow, y + shadow ,after_current_char);
		
		draw_set_color(c_white);
		draw_text(x + offset, y ,after_current_char);
	}
}

function draw_game_over() {
	var font_height = string_height("Hello world");
	var highscore_width = string_width("Highscore");
	
	var mid_x = room_width / 2;
	var mid_y = room_height / 2;
	
	var box_w = highscore_width * 2 + 64;
	var box_h =  font_height * 2 + 32;
	
	var rect_height = 32 + font_height * 2;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_sprite_stretched(spr_ui_background, 0, mid_x, mid_y, box_w, box_h);
	
	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text(mid_x, mid_y  - 8 - box_h / 2, "Game Over");
	
	draw_set_color(c_yellow);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(mid_x, mid_y  + 8 + box_h / 2, "Press Space");

	draw_set_color(c_white);
	draw_set_halign(fa_left);
	
	draw_set_valign(fa_bottom);
	draw_text(mid_x - 16 - highscore_width, mid_y  - 8, "Score");
	
	draw_set_valign(fa_top);
	draw_text(mid_x -16 - highscore_width, mid_y  + 8, "Highscore");

	
	draw_set_valign(fa_bottom);
	var s_width = string_width(score);
	draw_text(mid_x + 16 + highscore_width - s_width, mid_y  - 8, score);
	
	draw_set_valign(fa_top);
	var hs_width = string_width(global.highscore);
	draw_text(mid_x +16 + highscore_width - hs_width, mid_y  + 8, global.highscore);
}

switch(global.game_state) {
	case game_states.not_started:
	case game_states.running:
		draw_current_text();
		draw_score();
		break;
	case game_states.game_over:
		draw_game_over();
		break
}
