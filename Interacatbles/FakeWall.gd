extends StaticBody2D

tool
export (String) var plate_group = "" setget label


func _ready():
	if not Engine.is_editor_hint():
		add_to_group(plate_group)
		$Label.hide()

func label(group):
	plate_group = group
	$Label.text = group

func switch_changed(on):
	$Sprite.visible = !on
	if on:
		collision_layer = 0
	else:
		collision_layer = 1
