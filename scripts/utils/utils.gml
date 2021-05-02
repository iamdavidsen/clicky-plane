function play_random_sound(sounds, priority) {
	var sound = sounds[floor(random(array_length((sounds))))];
	
	audio_play_sound(sound, priority, 0);
}