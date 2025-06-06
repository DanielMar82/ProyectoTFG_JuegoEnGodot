extends CanvasLayer

signal on_transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	

func _on_animation_finished(animation):
	if animation == "fadeToBlack":
		on_transition_finished.emit()
		animation_player.play("fadeToNormal")
	elif animation == "fadeToNormal":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fadeToBlack")
