extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#AudioSpScene.level_music = "res://Music_Sounds/Music/Room.wav"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_audio_stream_player_finished():
	audio_stream_player.play()
