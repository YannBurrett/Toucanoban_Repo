extends Node

export (Array, Resource) var levels
var current_level = 0 setget set_level

var Music_volume = -3 setget set_music_volume
var SFX_volume = -3 setget set_sfx_volume
var Music_Mute = false setget set_music_mute
var fullscreen = false setget set_fullscreen

var config = ConfigFile.new()
const CONFIG_FILE = "user://settings.cfg"

var settings = {
		"audio":
			{"MusicVolume": null, "MusicMute": null, "SFXVolume": null},
		"video":
			{"fullscreen": null},
		"level":
			{"current_level": null}
		}

var default_settings = {
		"audio":
			{"MusicVolume": -3, "MusicMute": true, "SFXVolume": -3},
		"video":
			{"fullscreen": false},
		"level":
			{"current_level": 0}
		}



func _ready():
	load_settings()
	Music_Mute = settings["audio"]["MusicMute"]
	Music_volume = settings["audio"]["MusicVolume"]
	SFX_volume = settings["audio"]["SFXVolume"]
	fullscreen = settings["video"]["fullscreen"]
	current_level = settings["level"]["current_level"]
	

	get_tree().call_group("GUI", "update_GUI")


func load_settings():
	var error = config.load(CONFIG_FILE)
	if error != OK:
		make_default_config()
	
	for section in settings.keys():
		for key in settings[section]:
			settings[section][key] = config.get_value(section, key, default_settings[section][key])
	save_settings()


func save_settings():
	for section in settings.keys():
		for key in settings[section]:
			config.set_value(section, key, settings[section][key])
	config.save(CONFIG_FILE)


func make_default_config():
	config.save(CONFIG_FILE)



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
	settings["audio"]["MusicVolume"] = Music_volume
	save_settings()


func set_sfx_volume(volume:int):
	AudioServer.set_bus_volume_db(2, -10 + volume)
	SFX_volume = volume
	settings["audio"]["SFXVolume"] = SFX_volume
	save_settings()


func set_music_mute(mute:bool):
	if mute:
		Music.stop()
	elif not Music.is_playing():
		Music.play()
	Music_Mute = mute
	settings["audio"]["MusicMute"] = Music_Mute
	save_settings()


func set_fullscreen(f_screen:bool):
	OS.window_fullscreen = f_screen
	fullscreen = f_screen
	settings["video"]["fullscreen"] = fullscreen
	save_settings()
	


func set_level(new_level):
	current_level = new_level
	settings["levels"]["current_level"] = current_level
	save_settings()



