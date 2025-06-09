extends CharacterBody2D

var gravity = 20
const SPEED = 150
var moving_left = true

const Jump_force = -400
const wait_time = 2.0
var is_waiting = true
var jump_ready = false
var timer = 0.0
var just_jumped = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var ray_cast_2d: RayCast2D = $Area2D/RayCast2D
@onready var ray_cast_horizontal: RayCast2D = $Area2D/RayCastHorizontal

@onready var area_2d_detect: Area2D = $Area2DDetect
@onready var collision_detect_player: CollisionShape2D = $Area2D/CollisionDetectPlayer


var player: CharacterBody2D = null
var is_following: bool = false

func _ready() -> void:
	timer = wait_time

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if is_on_floor():
		if not is_waiting:
			is_waiting = true
			timer = wait_time
			velocity.x = 0
	if is_waiting:
		timer -= delta
		if timer <= 0:
			jump_ready = true
			is_waiting = false
	
	if jump_ready and is_on_floor():
		jump_ready = false
		jump()
		
	
	if is_following and player != null:
		follow()
	else:
		patrol()
	move_character()
	update_animation()

func jump():
	velocity.y = Jump_force
	velocity.x = -SPEED if moving_left else SPEED
	just_jumped = true

func follow():
	var direction = player.global_position.x - global_position.x
	if abs(direction) > 5:
		var was_moving_left = moving_left
		moving_left = direction < 0
		
		if was_moving_left != moving_left:
			scale.x = -scale.x

func patrol():
	if ray_cast_horizontal.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x

func move_character():
	velocity.y += gravity
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		body._loseLife(position.x)


func _on_area_2d_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		is_following = true


func _on_area_2d_detect_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("JUGADOR SALE")
		player = null
		is_following = false
		

func update_animation():
	if not is_on_floor():
		if velocity.y < 0:
			animation_player.play("Jump")
		else:
			animation_player.play("Fall")
	elif is_on_floor() and velocity.x == 0:
		animation_player.play("Idle")
