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
	
func get_input():	
	var up = Input.get_action_strength("ui_select")	
							
	if(up != 0):
		velocity.y = impulse
		player_state = state.IMPULSE				
	else:		
		velocity.x = 0			

func _proportion_water_gravity():
	if(get_tree().get_root().get_node("Main") != null):
		var player = get_tree().get_root().get_node("Main").get_node("Player")			
		var pos_y = player.position.y
		
		#CORRIGIR POSTERIORMENTE*
		if(pos_y > 550):
			jetpack_water.scale.y = 0.3
		if(pos_y > 525 && pos_y < 550):
			jetpack_water.scale.y = 0.3
		elif(pos_y > 500 && pos_y < 525):
			jetpack_water.scale.y = 0.4
		elif(pos_y > 475 && pos_y < 500):
			jetpack_water.scale.y = 0.5
		elif(pos_y > 450 && pos_y < 475):
			jetpack_water.scale.y = 0.6
		elif(pos_y > 425 && pos_y < 450):
			jetpack_water.scale.y = 0.7
		elif(pos_y > 400 && pos_y < 425):
			jetpack_water.scale.y = 0.75
		elif(pos_y > 375 && pos_y < 400):
			jetpack_water.scale.y = 0.75
		elif(pos_y > 350 && pos_y < 375):
			jetpack_water.scale.y = 0.75
		elif(pos_y > 325 && pos_y < 350):
			jetpack_water.scale.y = 0.75
		elif(pos_y > 300 && pos_y < 325):
			jetpack_water.scale.y = 0.8
		elif(pos_y > 275 && pos_y < 300):
			jetpack_water.scale.y = 0.85
		elif(pos_y > 250 && pos_y < 275):
			jetpack_water.scale.y = 0.9
		elif(pos_y > 240 && pos_y < 250):
			jetpack_water.scale.y = 0.95
		elif(pos_y > 225 && pos_y < 240):
			jetpack_water.scale.y = 1
		elif(pos_y > 200 && pos_y < 225):
			jetpack_water.scale.y = 1.05
		elif(pos_y > 175 && pos_y < 200):
			jetpack_water.scale.y = 1.1
		elif(pos_y > 150 && pos_y < 175):
			jetpack_water.scale.y = 1.15
		elif(pos_y > 125 && pos_y < 150):
			jetpack_water.scale.y = 1.2
		elif(pos_y > 100 && pos_y < 125):
			jetpack_water.scale.y = 1.25
		elif(pos_y > 75 && pos_y < 100):
			jetpack_water.scale.y = 1.3
		elif(pos_y > 50 && pos_y < 75):
			jetpack_water.scale.y = 1.35
		elif(pos_y > 25 && pos_y < 50):
			jetpack_water.scale.y = 1.4
		elif(pos_y > 0 && pos_y < 25):
			jetpack_water.scale.y = 1.45	
		elif(pos_y < 0):
			jetpack_water.scale.y = 1.5					
		
func _physics_process(delta):
	if(get_tree().get_root().get_node("Main") != null):
		jetpack_water = get_tree().get_root().get_node("Main").get_node("Player").get_node("Water")			
		jetpack_water.scale.y = 1.5
	
	get_input()	
				
	velocity.y += gravity * delta	
	velocity = move_and_slide(velocity, Vector2.UP)		
		
	_proportion_water_gravity()
	
	
func _on_TimerGame_timeout():	
	gravity += 60
	impulse -= 30
