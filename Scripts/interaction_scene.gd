extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@export var event: String

@export var next_scene_path: String
@export var player_spawn_position: Vector2 = Vector2.ZERO

@export var dialogue: String
@export var charecter: bool
@export var dialoguePoint: String


@export var requires_flag: bool = false
@export var required_flag_name: String = ""
@export var locked_dialogue: String
@export var locked_dialogue_point: String

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var player = get_tree().get_current_scene().get_node("Player")
	
	Save.playerPos = player.global_position
	
	if player and not player.is_on_floor():
		return
	
	if player:
		player.can_move = false
		player.animationPlayer.play("Idle")
	
	if event == "Change":
		if requires_flag and not GameState.get(required_flag_name):
			if charecter and player.position.x < position.x:
				scale.x = 2
			elif charecter and player.position.x > position.x:
				scale.x = -2

			DialogueManager.show_example_dialogue_balloon(load(locked_dialogue), locked_dialogue_point)
			await DialogueManager.dialogue_ended
			player.can_move = true
			return
		
		GameState.player_spawn_position = player_spawn_position
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file(next_scene_path)
		
	elif event == "Dialogue":
		if charecter && player.position.x < position.x:
			scale.x = 2
		elif charecter && player.position.x > position.x:
			scale.x = -2
		DialogueManager.show_example_dialogue_balloon(load(dialogue), dialoguePoint)
		await DialogueManager.dialogue_ended
		
		player.can_move = true

func saveData():
	var player = get_tree().get_current_scene().get_node("Player")
	
	if player:
		
		Save.game_data["Position"] = player.global_position
		Save.game_data["Lifes"] = GameState.lifes
		Save.game_data["Coins"] = GameState.recolectedCoins
		Save.game_data["Scene"] = get_tree().current_scene.scene_file_path
		Save.game_data["activeMom"] = GameState.peticionMadre
		Save.game_data["activeShop"] = GameState.shop_visited
		Save.game_data["activeBread"] = GameState.bread
		
		Save.save_game()
	else:
		return
