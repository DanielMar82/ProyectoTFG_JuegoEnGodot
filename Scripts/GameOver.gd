extends Control

@onready var audio_moves: AudioStreamPlayer = $AudioMoves
@onready var audio_click: AudioStreamPlayer = $AudioClick

func _ready() -> void:
	$ColorRect/VBoxContainer/RePlayButton.grab_focus()
	AudioSpScene.play_music_gameover()


func _process(delta: float) -> void:
	pass


func _on_re_play_button_pressed() -> void:
	audio_click.play()
	Save.load_game()
	
	GameState.lifes = Save.game_data["Lifes"]
	GameState.recolectedCoins = Save.game_data["Coins"]
	GameState.peticionMadre = Save.game_data["activeMom"]
	GameState.shop_visited = Save.game_data["activeShop"]
	GameState.bread = Save.game_data["activeBread"]
	GameState.collected_coins = Save.game_data["coinsCollected"]
	GameState.game_over_triggered = false
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished

	get_tree().change_scene_to_file(Save.game_data["Scene"])
	GameState.player_spawn_position = Save.game_data["Position"]


func _on_menu_start_button_pressed() -> void:
	audio_click.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/MenuInicio.tscn")


func _on_button_focus_entered() -> void:
	audio_moves.play()
