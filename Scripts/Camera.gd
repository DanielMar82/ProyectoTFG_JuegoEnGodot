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
	# Inicializa la posición y bloqueada para evitar saltos al cambiar de estado
	#locked_y_position = global_position.y

func _process(delta):
	
	if Input.is_action_pressed("look_up"):
		position.y = clamp(position.y - move_amount * delta, initial_position.y + lower_limit, initial_position.y + upper_limit)
	elif Input.is_action_pressed("look_down"):
		position.y = clamp(position.y + move_amount * delta, initial_position.y + lower_limit, initial_position.y + upper_limit)
	else:
		position.y = lerp(position.y, initial_position.y, 0.1)
	#var player_pos = get_parent().global_position  # Asumiendo cámara es hijo del jugador
	
	#if not is_locked:
		#if player_pos.x > lock_x_position:
			#is_locked = true
			## Bloqueamos la posición Y actual para que no salte cuando se bloquea
			#locked_y_position = global_position.y
	#else:
		#if player_pos.x < lock_x_position:
			#is_locked = false
#
	#if is_locked:
		## Mantener X bloqueada y Y bloqueada para evitar saltos
		#global_position.x = lock_x_position
		#global_position.y = locked_y_position
	#else:
		## Seguir al jugador en X e Y cuando no está bloqueada
		#global_position = player_pos
