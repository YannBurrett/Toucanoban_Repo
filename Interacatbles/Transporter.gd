extends Area2D
tool

var on_sprite = preload("res://Sprites/Tansporter_on.png")
var off_sprite = preload("res://Sprites/Tansporter_off.png")

export (String) var plate_group = "" setget label

var payload = null

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
		if payload:
			get_tree().call_group(plate_group, "payload_ready")
	else:
		$Sprite.texture = off_sprite


func _on_Transporter_area_entered(crate):
	payload = crate


func _on_Transporter_area_exited(area):
	payload = null


func send_payload(target:Vector2):
	payload.global_position = target
	$AudioStreamPlayer.play()
	payload = null






