extends Control

#func _ready() -> void:
	#$PanelContainer/VBoxContainer/VolumeButton.grab_focus()

func restart():
	$AnimationPlayer.play_backwards("Blur")
	get_tree().paused = false
	visible = false  

func pause():
	visible = true
	$AnimationPlayer.play("Blur")
	get_tree().paused = true
	$PanelContainer/VBoxContainer/VolumeButton.grab_focus()
	

func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		restart()


func _on_restart_button_pressed() -> void:
	restart()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _process(delta):
	testEsc()


func _on_volume_button_pressed() -> void:
	pass # Replace with function body.


func _on_resolution_button_pressed() -> void:
	pass # Replace with function body.
