extends Control

var scroll_speed := 20
@onready var clouds: Sprite2D = $ParallaxBackground/ParallaxClouds/Clouds


func _ready() -> void:
	$VBoxContainer/VolumeButton.grab_focus()

func _process(delta):
	clouds.position.x -= scroll_speed * delta

func _on_volume_button_pressed() -> void:
	print("Botón de volumen pulsado")


func _on_resolution_button_pressed() -> void:
	print("Botón de resolución pulsado")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MenuInicio.tscn")
