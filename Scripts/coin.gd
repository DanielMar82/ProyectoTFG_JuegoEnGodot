extends Node2D

@onready var animationCoin: AnimationPlayer = $Area2D/AnimationPlayer
@onready var audioPlayerCoin: AudioStreamPlayer = $Area2D/AudioStreamPlayer

func _ready():
	animationCoin.play("Idle")
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		audioPlayerCoin.play()
		await get_tree().create_timer(0.1).timeout
		queue_free()
		pass
