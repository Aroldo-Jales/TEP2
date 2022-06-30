extends Button

signal pause_game

func _ready():
	pass

func _on_ButtonPause_pressed():	
	if(not get_tree().paused):
		get_tree().paused = true
		$ButtonResume.visible = true
		$ButtonMenu.visible = true	
	else:
		get_tree().paused = false
		$ButtonResume.visible = false
		$ButtonMenu.visible = false

func _on_ButtonResume_pressed():	
	$ButtonResume.visible = false
	$ButtonMenu.visible = false	
	get_tree().paused = not get_tree().paused

func _on_ButtonMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/ui/Menu.tscn")
