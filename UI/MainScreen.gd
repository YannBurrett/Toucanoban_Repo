extends Control


func _on_ButtonNewGame_pressed():
	Gamestate.current_level = 0
	Gamestate.load_level()


func _on_ButtonContinue_pressed():
	Gamestate.load_level()


func _on_ButtonOptions_pressed():
	$Options.popup_centered()


func _on_ButtonHowToPlay_pressed():
	$HowToPlay.popup_centered()


func _on_ButtonQuit_pressed():
	get_tree().quit()
