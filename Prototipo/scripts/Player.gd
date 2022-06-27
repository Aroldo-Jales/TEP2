extends KinematicBody2D

export (int) var speed = 700
export (int) var gravity = 700
var impulse: int = -300

enum state { IMPULSE, FALL}

var player_state 
var velocity
var jetpack_water

func _init():
	velocity = Vector2.ZERO
	player_state = state.FALL
	
func _ready():
	collision_layer = 0
	set_collision_layer_bit(CollisionLayers.Layers.PLAYER, true)  
	collision_mask = 0
	set_collision_mask_bit(CollisionLayers.Layers.WALL, true)
	
	jetpack_water = get_tree().get_root().get_node("Main").get_node("Player").get_node("Water")
	jetpack_water.process_material.gravity.y = 900		

func get_input():
	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var up = Input.get_action_strength("ui_select")	
	
	if(dir != 0):
		velocity.x = dir * speed				
		player_state = state.IMPULSE
		print(velocity)
		
	if(up != 0):
		velocity.y = impulse
		player_state = state.IMPULSE
		jetpack_water.process_material.gravity.y = 600					
		print(velocity)
		
	else:		
		velocity.x = 0
		jetpack_water.process_material.gravity.y = 100
					
func _physics_process(delta):
	get_input()					
	velocity.y += gravity * delta	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_TimerGame_timeout():
	speed += 50
	gravity += 60
	impulse -= 30
	
