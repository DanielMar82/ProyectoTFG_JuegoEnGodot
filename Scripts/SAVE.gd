extends Node

var save_path = "user://save_game.dat"

var playerPos = Vector2.ZERO

var game_data : Dictionary = {
	"Lifes" : 6,
	"Coins" : 0,
	"Position" : Vector2.ZERO,
	"Scene": "res://Scenes/Room.tscn",
	"activeMom": false,
	"activeShop": false,
	"activeBread": false,
	"coinsColected": []
}

func save_game() -> void:
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_var(game_data)
	save_file = null

func load_game() -> void:
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)
		game_data = save_file.get_var()
		save_file = null


func saveData():
		Save.game_data["Position"] = playerPos
		Save.game_data["Lifes"] = GameState.lifes
		Save.game_data["Coins"] = GameState.recolectedCoins
		Save.game_data["Scene"] = get_tree().current_scene.scene_file_path
		Save.game_data["activeMom"] = GameState.peticionMadre
		Save.game_data["activeShop"] = GameState.shop_visited
		Save.game_data["activeBread"] = GameState.bread
		Save.game_data["coinsCollected"] = GameState.collected_coins
		
		Save.save_game()  
