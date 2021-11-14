extends Popup

onready var VolumeSlider = $Panel/VBoxContainer/SliderMusic
onready var VolumeSFX = $Panel/VBoxContainer/SliderSFX
onready var Mute = $Panel/VBoxContainer/CenterContainer/GridContainer/ButtonMute
onready var FullScreenButton = $Panel/VBoxContainer/CenterContainer/GridContainer/ButtonFullScreen


func update_GUI():
	VolumeSlider.value = Gamestate.Music_volume
	VolumeSFX.value = Gamestate.SFX_volume
	Mute.pressed = Gamestate.Music_Mute
	FullScreenButton.pressed = Gamestate.fullscreen


func _on_SliderMusic_value_changed(value):
	Gamestate.Music_volume = value


func _on_SliderSFX_value_changed(value):
	Gamestate.SFX_volume = value


func _on_ButtonMute_toggled(button_pressed):
	Gamestate.Music_Mute = button_pressed


func _on_ButtonFullScreen_toggled(button_pressed):
	Gamestate.fullscreen = button_pressed


func _on_ButtonDone_pressed():
	hide()
