extends Node

export (Array, Resource) var levels
var current_level = 0

func load_level():
	var scene
	if current_level == levels.size():
		get_tree().change_scene("res://UI/MainScreen.tscn")
		current_level = 0
	else:
		scene = levels[current_level]
		get_tree().change_scene_to(scene)
