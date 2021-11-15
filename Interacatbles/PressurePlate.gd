extends Area2D
tool
export (String) var plate_group = "" setget label


func _ready():
	if not Engine.is_editor_hint():
		add_to_group(plate_group)
		$Label.hide()

func label(group):
	plate_group = group
	$Label.text = group


func _on_PressurePlate_area_entered(_area):
	get_tree().call_group(plate_group, "switch_changed", true)


func _on_PressurePlate_area_exited(_area):
	get_tree().call_group(plate_group, "switch_changed", false)

