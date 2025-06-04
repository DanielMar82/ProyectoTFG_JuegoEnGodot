extends Control

var scroll_speed := 20
@onready var clouds: Sprite2D = $ParallaxBackground/ParallaxLayer2/Clouds

func _ready() -> void:
	$VBoxContainer/PlayButton.grab_focus()
	#AudioSpScene.musicName = "res://Music_Sounds/Music/Menu.wav"
	AudioSpScene.play_music_level()

func _process(delta):
	clouds.position.x -= scroll_speed * delta

func _on_play_button_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/city.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/OptionsMenu.tscn")
