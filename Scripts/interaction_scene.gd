extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@export var event: String

@export var next_scene_path: String
@export var player_spawn_position: Vector2 = Vector2.ZERO

@export var dialogue: String
@export var charecter: bool
@export var dialoguePoint: String


@export var requires_flag: bool = false
@export var required_flag_name: String = ""
@export var locked_dialogue: String
@export var locked_dialogue_point: String

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var player = get_tree().get_current_scene().get_node("Player")
	
	if player and not player.is_on_floor():
		return
	
	if player:
		player.can_move = false
		player.animationPlayer.play("Idle")
		#player.animationPlayer.stop() HAY QUE HACER QUE EL PLAYER NO SE QUEDE EN IDLE DESPUES DEL EVENTO
	
	if event == "Change":
		if requires_flag and not GameState.get(required_flag_name):
			# Mostrar diálogo bloqueado
			if charecter and player.position.x < position.x:
				scale.x = 2
			elif charecter and player.position.x > position.x:
				scale.x = -2

			DialogueManager.show_example_dialogue_balloon(load(locked_dialogue), locked_dialogue_point)
			await DialogueManager.dialogue_ended
			player.can_move = true
			return
		
		# Si el flag está permitido o no se requiere flag, cambiar de escena
		GameState.player_spawn_position = player_spawn_position
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file(next_scene_path)
		
	elif event == "Dialogue":
		print("Dialogo en curso")
		if charecter && player.position.x < position.x:
			scale.x = 2
		elif charecter && player.position.x > position.x:
			scale.x = -2
		DialogueManager.show_example_dialogue_balloon(load(dialogue), dialoguePoint)
		await DialogueManager.dialogue_ended
		player.can_move = true
		
	elif event == "Save":
		print("JUGADOR QUIERE GUARDAR")
		player.can_move = true
	
