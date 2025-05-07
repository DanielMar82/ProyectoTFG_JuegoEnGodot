extends CharacterBody2D


const moveSpeed = 100
const maxSpeed = 150

const jumpHeight = -400
const up = Vector2(0, -1)
const gravity = 15

@onready var sprite = $Sprite2D
@onready var animationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	velocity.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		animationPlayer.play("Run")
		velocity.x = min(velocity.x + moveSpeed,maxSpeed)
		
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		animationPlayer.play("Run")
		velocity.x = max(velocity.x - moveSpeed,-maxSpeed)
		
	else :
		animationPlayer.play("Idle")
		friction = true
	
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y = jumpHeight
		if(friction == true):
			velocity.x = lerp(velocity.x ,0.0,0.5)
			
	else:
		if friction == true:
			velocity.x = lerp(velocity.x,0.0,0.01)
	
	move_and_slide()
