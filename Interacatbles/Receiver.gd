extends Area2D

tool

var on_sprite = preload("res://Sprites/Recierver_on.png")
var off_sprite = preload("res://Sprites/Recierver_off.png")

export (String) var plate_group = "" setget label

var clear = true

func _ready():
	if not Engine.is_editor_hint():
		add_to_group(plate_group)
		$Label.hide()

func label(group):
	plate_group = group
	$Label.text = group


func switch_changed(power):
	if power:
		$Sprite.texture = on_sprite
	else:
		$Sprite.texture = off_sprite


func payload_ready():
	if clear:
		get_tree().call_group(plate_group, "send_payload", global_position)
		clear = false


func _on_Receiver_area_entered(_area):
	clear = false


func _on_Receiver_area_exited(_area):
	clear = true
