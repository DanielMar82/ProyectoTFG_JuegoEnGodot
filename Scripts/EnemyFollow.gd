extends CharacterBody2D

var gravity = 10
const SPEED = 25
var moving_left = true

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ray_cast_2d: RayCast2D = $Area2D/RayCast2D
@onready var ray_cast_horizontal: RayCast2D = $Area2D/RayCastHorizontal



func _physics_process(delta: float) -> void:
	turn()
	move_character()

func turn():
	#ray_cast_2d.force_raycast_update()  # Asegúrate de que el raycast esté actualizado
	#ray_cast_horizontal.force_raycast_update()  # Asegúrate de que el raycast horizontal esté actualizado

	# Verifica si hay colisiones
	if not ray_cast_2d.is_colliding() or ray_cast_horizontal.is_colliding():
		# Si no hay suelo y hay un muro enfrente, el enemigo se da la vuelta
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
		body._loseLife(position.x)
