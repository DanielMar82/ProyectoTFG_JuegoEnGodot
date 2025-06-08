extends CanvasLayer

@onready var label_coins_colected: Label = $Panel/CoinsColected
@onready var sprite_2d_hearts: Sprite2D = $Panel/Sprite2DHearts


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_coins_colected.text = str(GameState.recolectedCoins)
	sprite_2d_hearts.frame = GameState.lifes - 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _sumCoinsNum():
	label_coins_colected.text = str(GameState.recolectedCoins)
	

func _lose_life():
	sprite_2d_hearts.frame -= 1
