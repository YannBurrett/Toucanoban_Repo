extends "res://Templates/Moveable.gd"


func _unhandled_input(event):
	if event.is_action_pressed("Up"):
		move(Vector2.UP)
	elif event.is_action_pressed("Right"):
		move(Vector2.RIGHT)
	elif event.is_action_pressed("Down"):
		move(Vector2.DOWN)
	elif event.is_action_pressed("Left"):
		move(Vector2.LEFT)


func move(direction:Vector2):
	if moving:
		return
	if direction_free(direction):
		moving = true
		direction *= TILE_SIZE
		$Tween.interpolate_property(self, "position", position, 
				position + direction, SPEED,Tween.TRANS_LINEAR, 
				Tween.EASE_OUT_IN, 0)
		$Tween.start()


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





