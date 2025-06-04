extends CharacterBody2D

var gravity = 10
const SPEED = 25
var moving_left = true

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	turn()
	move_character()

func turn():
	if not $Area2D/RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x

func move_character():
	animation_player.play("Move")
	velocity.y += gravity
	if moving_left:
		velocity.x = -SPEED
	else:
		velocity.x = SPEED
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		print("JUGADOR TOCADO")
		pass
