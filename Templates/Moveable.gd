extends Area2D


const TILE_SIZE = 64
var speed = .25

var moving = false


func _on_Tween_tween_completed(_object, _key):
	moving = false






func direction_free(direction):
	match direction:
		Vector2.UP:
			return not $RayUp.is_colliding()
		Vector2.RIGHT:
			return not $RayRight.is_colliding()
		Vector2.DOWN:
			return not $RayDown.is_colliding()
		Vector2.LEFT:
			return not $RayLeft.is_colliding()
