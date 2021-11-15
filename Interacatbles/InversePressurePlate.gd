extends "res://Interacatbles/PressurePlate.gd"
tool


func _ready():
	get_tree().call_group(plate_group, "switch_changed", true)

func _on_InversePressurePlate_area_entered(area):
	get_tree().call_group(plate_group, "switch_changed", false)


func _on_InversePressurePlate_area_exited(area):
	get_tree().call_group(plate_group, "switch_changed", true)
