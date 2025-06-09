extends Control

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _input(event):
	if event is InputEventKey:  
		if event.is_pressed():  
			_on_any_key_pressed() 

func _on_any_key_pressed():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().quit()

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_audio_stream_player_finished() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().quit()
