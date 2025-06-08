extends Control

var scroll_speed := 20
@onready var clouds: Sprite2D = $ParallaxBackground/ParallaxClouds/Clouds
@onready var audio_moves: AudioStreamPlayer = $AudioMoves
@onready var audio_click: AudioStreamPlayer = $AudioClick

func _ready() -> void:
	$VBoxContainer/VolumeButton.grab_focus()

func _process(delta):
	clouds.position.x -= scroll_speed * delta

func _on_volume_button_pressed() -> void:
	audio_click.play()
	print("Botón de volumen pulsado")


func _on_resolution_button_pressed() -> void:
	audio_click.play()
	print("Botón de resolución pulsado")


func _on_back_button_pressed() -> void:
	audio_click.play()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/MenuInicio.tscn")


func _on_button_focus_entered() -> void:
	audio_moves.play()
