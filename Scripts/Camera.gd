extends Camera2D

@export var lock_x_position: float = 100.0

var is_locked: bool = false
var locked_y_position: float = 0.0

var move_amount = 200
@export var upper_limit: float = 50.0
@export var lower_limit: float = -50.0

var initial_position: Vector2

func _ready():
	initial_position = position

func _process(delta):
	
	if Input.is_action_pressed("look_up"):
		position.y = clamp(position.y - move_amount * delta, initial_position.y + lower_limit, initial_position.y + upper_limit)
	elif Input.is_action_pressed("look_down"):
		position.y = clamp(position.y + move_amount * delta, initial_position.y + lower_limit, initial_position.y + upper_limit)
	else:
		position.y = lerp(position.y, initial_position.y, 0.1)
