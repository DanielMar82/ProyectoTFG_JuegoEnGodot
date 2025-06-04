extends AudioStreamPlayer


const level_music = preload("res://Music_Sounds/Music/Menu.wav")

func _play_music(music: AudioStream, volumen = -15.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volumen
	play()

func  play_music_level():
	_play_music(level_music)
