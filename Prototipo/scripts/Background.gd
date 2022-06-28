extends Sprite

var velocity: float = -15.0
var g_texture_width = 0

func _ready():
	g_texture_width = texture.get_size().x * scale.x

func _process(delta):
	position.x += velocity 
	_attempt_reposition()
	
func _attempt_reposition():
	if position.x < -g_texture_width:
		position.x += 2 * g_texture_width		

func _on_TimerGame_timeout():
	velocity -= 1	 
