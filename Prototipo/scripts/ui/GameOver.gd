extends Node2D

func _ready():
	pass 

func _on_ButtonRestart_pressed():
	get_tree().change_scene("res://scenes/game/Main.tscn")

func _on_ButtonMenu_pressed():
	get_tree().change_scene("res://scenes/ui/Menu.tscn")
