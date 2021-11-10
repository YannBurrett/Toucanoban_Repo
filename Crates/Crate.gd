extends "res://Templates/Moveable.gd"

signal blocked

func _ready():
	speed *= .75

func _on_Crate_area_entered(player):
	var player_direction = Vector2(player.global_position - global_position).normalized()
	move(-player_direction)

func move(direction:Vector2):
	if moving:
		return
	if direction_free(direction):
		moving = true
		direction *= TILE_SIZE
		$Tween.interpolate_property(self, "position", position, 
				position + direction, speed,Tween.TRANS_LINEAR, 
				Tween.EASE_OUT_IN, 0)
		$Tween.start()
	else:
		emit_signal("blocked")
