extends Node2D

func _ready():
	pass

func _on_ButtonStart_pressed():
	get_tree().change_scene("res://scenes/game/Main.tscn")

func _on_ButtonClose_pressed():
	get_tree().quit()
