extends Control

@onready var audio_moves: AudioStreamPlayer = $AudioMoves
@onready var audio_click: AudioStreamPlayer = $AudioClick

func restart():
	$AnimationPlayer.play_backwards("Blur")
	get_tree().paused = false
	visible = false  

func pause():
	visible = true
	$AnimationPlayer.play("Blur")
	get_tree().paused = true
	$PanelContainer/VBoxContainer/RestartButton.grab_focus()
	
	

func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		restart()


func _on_restart_button_pressed() -> void:
	audio_click.play()
	restart()

func _on_start_menu_button_pressed() -> void:
	audio_click.play()
	visible = false
	get_tree().paused = false
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/MenuInicio.tscn")

func _on_exit_button_pressed() -> void:
	audio_click.play()
	get_tree().quit()


func _process(delta):
	testEsc()


func _on_volume_button_pressed() -> void:
	audio_click.play()


func _on_resolution_button_pressed() -> void:
	audio_click.play()


func _on_button_focus_entered() -> void:
	audio_moves.play()
