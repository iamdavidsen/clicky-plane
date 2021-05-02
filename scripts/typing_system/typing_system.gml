function get_random_word() {
	var length = array_length(words);
	var r = random(length);
	var f = floor(r);
	
	
	return words[f];
}

function create_sequence(x_pos, y_pos) {
	var word = get_random_word();
	
	var sequence_object = ds_map_create();
	ds_map_add(sequence_object, "word", word);
	
	ds_list_add(sequences, sequence_object);
	
	var sequence_index = ds_list_find_index(sequences, sequence_object);
	
	global.current_text_sequence = sequence_object;
	global.current_text_index = 1;
}

function find_sequence() {
	for (var i = 0; i < ds_list_size(sequences); i++) {
		var sequence = ds_list_find_value(sequences, i);
		var word = ds_map_find_value(sequence, "word");
		
		if (string_lower(string(chr(keyboard_lastkey))) == string_lower(string_char_at(word, 0))) {
			return sequence;	
		}
	}
	
	return -1;
}

function remove_sequence(sequence) {
	var sequence_index = ds_list_find_index(sequences, sequence);
	
	ds_list_delete(sequences, sequence_index);
}

function clear_sequences() {
	ds_list_clear(sequences);
}