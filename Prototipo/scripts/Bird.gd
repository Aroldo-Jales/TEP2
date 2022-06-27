extends KinematicBody2D

export (int) var gravity = 0

var velocity

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
		velocity.x = -900
		gravity = 5000		

	# REMOVER PASSARO AO SAIR DA TELA
	if(position.x < -250 or position.y > 900):
		print(">>>>>> bird_removed >>>>>>")
		queue_free()	