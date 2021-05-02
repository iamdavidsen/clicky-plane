event_inherited();

if (not done and x < room_width / 2) {
	done = true;
	
	audio_play_sound(coin, 1, 0);
	score += 1;
}