extends Control

var scroll_speed := 20
@onready var clouds: ParallaxLayer = $ParallaxBackground/ParallaxLayer2
@onready var audio_moves: AudioStreamPlayer = $AudioMoves
@onready var audio_click: AudioStreamPlayer = $AudioClick


func _ready() -> void:
	$VBoxContainer/PlayButton.grab_focus()
	AudioSpScene.play_music_level()
	GameState.lifes = 6
	GameState.game_over_triggered = false

func _process(delta):
	clouds.motion_offset.x -= scroll_speed * delta

func _on_play_button_pressed() -> void:
	audio_click.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Room.tscn")
	GameState.lifes = 6
	GameState.recolectedCoins = 0
	GameState.collected_coins = []
	GameState.peticionMadre = false
	GameState.shop_visited = false
	GameState.bread = false
	GameState.game_over_triggered = false


func _on_exit_button_pressed() -> void:
	audio_click.play()
	get_tree().quit()


func _on_options_button_pressed() -> void:
	audio_click.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/OptionsMenu.tscn")


func _on_button_focus_entered() -> void:
	audio_moves.play()


func _on_load_button_pressed() -> void:
	audio_click.play()
	Save.load_game()
	
	GameState.lifes = Save.game_data["Lifes"]
	GameState.recolectedCoins = Save.game_data["Coins"]
	GameState.peticionMadre = Save.game_data["activeMom"]
	GameState.shop_visited = Save.game_data["activeShop"]
	GameState.bread = Save.game_data["activeBread"]
	GameState.collected_coins = Save.game_data["coinsCollected"]
	
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file(Save.game_data["Scene"])
	GameState.player_spawn_position = Save.game_data["Position"]
