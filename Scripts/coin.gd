extends Node2D

@onready var animationCoin: AnimationPlayer = $Area2D/AnimationPlayer
@onready var audioPlayerCoin: AudioStreamPlayer = $Area2D/AudioStreamPlayer
@export var coin_id: String

func _ready():
	if GameState.collected_coins.has(coin_id):
		queue_free()
	animationCoin.play("Idle")
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		GameState.collected_coins.append(coin_id)
		GameState.recolectedCoins += 1
		body._add_coin()
		audioPlayerCoin.play()
		await get_tree().create_timer(0.1).timeout
		queue_free()
		pass
