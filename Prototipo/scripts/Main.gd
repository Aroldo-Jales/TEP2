extends Node2D

var enemy_time = 5
var enemy_velocity = Vector2(-900, 0)
var impulse = -300

var water_active: bool = false

func _ready():
	# WALLS
	_add_wall(Vector2(0, -10), Vector2(1600, 10)) # TOP
	_add_wall(Vector2(0, 750), Vector2(1600, 50)) # BOTTOM	
	_add_wall(Vector2(-10, -10), Vector2(10, 1600)) # LEFT
	_add_wall(Vector2(1610, -10), Vector2(10, 1600)) # RIGHT				
	
func _on_Timer_timeout():
	#TIMER ENEMIES
	randomize()
	var bird = preload("res://scenes/game/Bird.tscn").instance()
	var rand_y = rand_range(0, 650)
	bird.global_position = Vector2(1620, rand_y)			
	add_child(bird)			
	bird.connect('bird_fall', self, '_on_Bird_fall')
	bird.connect('game_over', self, '_on_Game_over')
	
	if(enemy_time < 1):
		$TimerEnemies.wait_time = 0.5
		
	$TimerEnemies.wait_time = enemy_time
	enemy_time -= 0.4
	
func _add_wall(position: Vector2, size: Vector2):
	var rect = RectangleShape2D.new()
	rect.set_extents(size)
	
	var collision_shape := CollisionShape2D.new()
	collision_shape.shape = rect
	
	var collision_object := StaticBody2D.new()
	collision_object.position = position
	collision_object.add_child(collision_shape)	
	
	collision_object.collision_layer = 0
	collision_object.set_collision_layer_bit(CollisionLayers.Layers.WALL, true)
	collision_object.collision_mask = 0
		
	add_child(collision_object)
	
func _on_TimerScore_timeout():
	#TIMER SCORE	
	$LabelScore.text = str(AutoLoad.score)	
	AutoLoad.score += int(1)
	
	if(!water_active):
		water_active = true
		$WaterBottom.visible = true

func _on_Bird_fall():
	$LabelScore.text = str(AutoLoad.score)
	AutoLoad.score += int(5)
		
func _on_Game_over():
	if(AutoLoad._get_Highscore() < AutoLoad.score):
		AutoLoad._set_Highscore(AutoLoad.score)
	
	get_tree().change_scene("res://scenes/ui/GameOver.tscn")	


func _on_TouchScreenButton_pressed():
	$Player.velocity.y = impulse		
	
func _on_TimerGame_timeout():		
	impulse -= 30
