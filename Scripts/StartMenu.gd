extends Control

var scroll_speed := 20
#@onready var clouds: Sprite2D = $ParallaxBackground/ParallaxLayer2/Clouds
@onready var clouds: ParallaxLayer = $ParallaxBackground/ParallaxLayer2
@onready var audio_moves: AudioStreamPlayer = $AudioMoves
@onready var audio_click: AudioStreamPlayer = $AudioClick


func _ready() -> void:
	$VBoxContainer/PlayButton.grab_focus()
	AudioSpScene.play_music_level()

func _process(delta):
	#pass
	clouds.motion_offset.x -= scroll_speed * delta

func _on_play_button_pressed() -> void:
	audio_click.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Room.tscn")
	GameState.lifes = 6
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
