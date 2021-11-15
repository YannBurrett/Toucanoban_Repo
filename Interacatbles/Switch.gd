extends "res://Interacatbles/PressurePlate.gd"
tool


func _on_PressurePlate_area_entered(area):
	._on_PressurePlate_area_entered(area)
	$AudioStreamPlayer.play()
	
