extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var interaction_mom: Node2D = $InteractionMom


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_tree().get_current_scene().get_node("Player")
	AudioSpScene.play_music_room()
	
	if !GameState.peticionMadre :
		player.can_move = false
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogues/Mom.dialogue"), "llamada")
		await DialogueManager.dialogue_ended
		player.can_move = true
	

func _process(delta: float) -> void:
	if GameState.peticionMadre :
		interaction_mom.dialoguePoint = "encurso"

	

func _on_audio_stream_player_finished():
	audio_stream_player.play()
