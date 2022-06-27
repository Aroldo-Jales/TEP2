extends Sprite

var VELOCITY: float = -15.0
var g_texture_width = 0

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta: float) -> void:
	position.x += VELOCITY
	_attempt_reposition()
	
func _attempt_reposition() -> void:
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width		


func _on_TimerGame_timeout():
	VELOCITY -= 1	 
