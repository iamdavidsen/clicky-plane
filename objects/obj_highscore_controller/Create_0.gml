ini_open("highscore.ini");
global.highscore = ini_read_real("save", "highscore", 0);
ini_close();

function save_new_highscore() {
	ini_open("highscore.ini");
	ini_write_real("save", "highscore", global.highscore);
	ini_close();
}