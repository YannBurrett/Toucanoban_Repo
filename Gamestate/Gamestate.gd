extends Node

export (Array, Resource) var levels
var current_level = 0

var Music_volume = -3 setget set_music_volume
var SFX_volume = -3 setget set_sfx_volume
var Music_Mute = false setget set_music_mute
var fullscreen = false setget set_fullscreen


func _ready():
	AudioServer.set_bus_volume_db(1, -10)
	AudioServer.set_bus_volume_db(2, -10)


func load_level():
	var scene
	if current_level == levels.size():
		get_tree().change_scene("res://UI/MainScreen.tscn")
		current_level = 0
	else:
		scene = levels[current_level]
		get_tree().change_scene_to(scene)


func set_music_volume(volume:int):
	AudioServer.set_bus_volume_db(1, -10 + volume)
	Music_volume = volume


func set_sfx_volume(volume:int):
	AudioServer.set_bus_volume_db(2, -10 + volume)
	SFX_volume = volume


func set_music_mute(mute:bool):
	if mute:
		Music.stop()
	elif not Music.is_playing():
		Music.play()
	Music_Mute = mute


func set_fullscreen(f_screen:bool):
	OS.window_fullscreen = f_screen
	fullscreen = f_screen
	






