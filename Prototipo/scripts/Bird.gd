extends KinematicBody2D

export (int) var gravity = 0
var velocity

signal bird_fall
var bird_is_fall: bool = false

func _init():
	velocity = Vector2.ZERO
	velocity.x = -500		
					
func _physics_process(delta):	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)	
			
	var player = get_tree().get_root().get_node("Main").get_node("Player")			
	var player_pos_x = player.position.x
	var player_pos_y = player.position.y
	
	var bird_pos_x = position.x
	var bird_pos_y = position.y
		
	if(bird_pos_x <= player_pos_x and bird_pos_y >= player_pos_y):			
		if(!bird_is_fall):
			bird_is_fall = true
			$LabelBirdScore.visible = true					
			emit_signal('bird_fall')		
			
		velocity.x = -900
		gravity = 5000		

	# REMOVER PASSARO AO SAIR DA TELA
	if(position.x < -250 or position.y > 900):
		print(">>>>>> bird_removed >>>>>>")
		queue_free()	

func _on_BirdArea_area_entered(area):
	get_tree().change_scene("res://scenes/ui/GameOver.tscn")
