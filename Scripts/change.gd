extends Area2D

@export var next_scene_path: String
@export var player_facing_right: bool
@export var player_spawn_position: Vector2 = Vector2.ZERO
@onready var sprite_2d: Sprite2D = $Sprite2D

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameState.player_spawn_position = player_spawn_position
		GameState.player_facing_right = player_facing_right
		change_scene()

func change_scene():
	var player = get_tree().get_current_scene().get_node("Player")
	
	if player:
		player.can_move = false
	
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file(next_scene_path)
