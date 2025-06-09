extends AudioStreamPlayer


const level_music = preload("res://Music_Sounds/Music/Menu.wav")
const city_music = preload("res://Music_Sounds/Music/City.wav")
const room_music = preload("res://Music_Sounds/Music/Room.wav")
const forest_music = preload("res://Music_Sounds/Music/Forest.wav")
const gameover_music = preload("res://Music_Sounds/Music/GameOver.wav")

func _play_music(music: AudioStream, volumen = -15.0):
	if stream == music and playing:
		return
	
	stream = music
	volume_db = volumen
	play()

func _stop_music():
	stop()

func  play_music_level():
	_play_music(level_music)
	
func  play_music_city():
	_play_music(city_music)
	
func  play_music_room():
	_play_music(room_music)
	
func  play_music_forest():
	_play_music(forest_music)
	
func  play_music_gameover():
	_play_music(gameover_music)
