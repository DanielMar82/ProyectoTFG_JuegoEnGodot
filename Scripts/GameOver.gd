extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect/VBoxContainer/RePlayButton.grab_focus()
	AudioSpScene.play_music_gameover()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_re_play_button_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/city.tscn")


func _on_menu_start_button_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/MenuInicio.tscn")
