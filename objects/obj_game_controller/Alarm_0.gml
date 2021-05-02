if (global.game_state == game_states.running) {
	alarm[0] = room_speed * spawn_rate;
	
	var postion, spread;
	
	postion = random_range(-140,140);
	spread = 120;
	
	instance_create_layer(room_width + 64, room_height / 2 + (postion  - spread) -32, "pipe_layer", obj_pillar_top);
	instance_create_layer(room_width+ 64, room_height / 2 + (postion  + spread) -32, "pipe_layer", obj_pillar_bottom);
}