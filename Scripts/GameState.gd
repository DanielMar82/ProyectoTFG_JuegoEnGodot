extends Node

var player_spawn_position: Vector2 = Vector2.ZERO
var player_facing_right: bool = true
var recolectedCoins: int
var lifes: int = 6

var peticionMadre = false;
var shop_visited = false;
var bread = false;

var collected_coins: Array = []
var game_over_triggered: bool = false

var saveGame = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if lifes <= 0 and not game_over_triggered:
		game_over_triggered = true
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
		

func finishGame():
	AudioSpScene.stop()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/End.tscn")
