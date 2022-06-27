extends Node2D

var enemy_time = 0.5
var enemy_velocity = Vector2(-900, 0)

func _ready() -> void:
	# WALLS
	_add_wall(Vector2(0, -10), Vector2(1600, 10)) # TOP
	_add_wall(Vector2(0, 900), Vector2(1600, 50)) # BOTTOM	
	_add_wall(Vector2(-10, -10), Vector2(10, 1600)) # LEFT
	_add_wall(Vector2(1610, -10), Vector2(10, 1600)) # RIGHT	
	
func _on_Timer_timeout():
	
	randomize()
	var bird = preload("res://scenes/Bird.tscn").instance()
	var rand_y = rand_range(0, 650)
	bird.global_position = Vector2(1620, rand_y)			
	add_child(bird)		
	
	$TimerEnemies.wait_time = enemy_time
	
func _add_wall(position: Vector2, size: Vector2) -> void:
	var rect := RectangleShape2D.new()
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
	
