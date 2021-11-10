extends Area2D


const TILE_SIZE = 64
const SPEED = .25

var moving = false


func _on_Tween_tween_completed(_object, _key):
	moving = false
