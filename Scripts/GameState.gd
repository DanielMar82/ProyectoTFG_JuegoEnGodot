extends Node

var player_spawn_position: Vector2 = Vector2.ZERO
var player_facing_right: bool = true
var recolectedCoins: int
var lifes: int = 6

var peticionMadre = false;
var shop_visited = false;

var game_over_triggered: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lifes <= 0 and not game_over_triggered:
		game_over_triggered = true
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
