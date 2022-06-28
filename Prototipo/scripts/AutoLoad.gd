extends Node

var score = 0
#var best = 0

const FILENAME = 'user://highscore.save'

func _set_Highscore(highscore):
	var file = File.new()
	file.open(FILENAME, File.WRITE)
	file.store_var(highscore)
	file.close()

func _get_Highscore():
	var highscore = 0
	var file = File.new()
	
	if(file.file_exists(FILENAME)):
		file.open(FILENAME, file.READ)
		highscore = file.get_var()
		file.close()
		
	return highscore
