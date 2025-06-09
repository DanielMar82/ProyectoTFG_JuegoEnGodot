extends CharacterBody2D


const moveSpeed = 100
const maxSpeed = 250

const jumpHeight = -500
const up = Vector2(0, -1)
const gravity = 20

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer
var coins: int = 20

var current_state = ""
var can_move: bool = true

func _ready() -> void:
	if GameState.player_spawn_position != Vector2.ZERO:
		position = GameState.player_spawn_position
		GameState.player_spawn_position = Vector2.ZERO
	sprite.flip_h = not GameState.player_facing_right

func _loseLife(enemyPosition):
	audio_stream_player.play()
	GameState.lifes -= 1
	
	if position.x < enemyPosition:
		velocity.x = -1000  
		velocity.y = -300   
	elif position.x > enemyPosition:
		velocity.x = 1000    
		velocity.y = -300 
	
	var coinslifesHud = $"../CoinsLifesHud"
	coinslifesHud._lose_life()

func _add_coin():
	var coinslifesHud = $"../CoinsLifesHud"
	coinslifesHud._sumCoinsNum()

func _physics_process(delta):
	if not can_move:
		return
	
	if not is_on_floor():
		velocity.y += gravity
	
	if is_on_floor() and Input.is_action_just_pressed("ui_jump"):
			velocity.y = jumpHeight
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * maxSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, maxSpeed)
	
	move_and_slide()
	
	animations(direction)
	
	if direction == 1:
		sprite.flip_h = false
	elif  direction == -1:
		sprite.flip_h = true
		
		
func animations(direction):
	var new_state = ""

	if not is_on_floor():
		if velocity.y < 0:
			new_state = "Jump"
		elif velocity.y > 0:
			new_state = "Fall"
	elif direction != 0:
		new_state = "Run"
	else:
		new_state = "Idle"

	if current_state != new_state:
		current_state = new_state
		animationPlayer.play(current_state)
