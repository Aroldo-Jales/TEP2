extends Node2D

func _ready():
	$LabelScoreNum.text = str(AutoLoad.score)
	$LabelHighScoreNum.text = str(AutoLoad._get_Highscore())
	AutoLoad.score = 0			
	
func _on_ButtonRestart_pressed():
	get_tree().change_scene("res://scenes/game/Main.tscn")

func _on_ButtonMenu_pressed():
	get_tree().change_scene("res://scenes/ui/Menu.tscn")
