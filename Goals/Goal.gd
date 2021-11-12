extends Area2D

signal filled

func _on_Goal_area_entered(area):
	emit_signal("filled", true)


func _on_Goal_area_exited(area):
	emit_signal("filled", false)
