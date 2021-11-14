extends Node2D

onready var Player = $Player

func _ready():
	for crate in $Crates.get_child_count():
		$Crates.get_child(crate).connect("blocked", Player, "blocked")


func _on_Goals_victory():
	Gamestate.current_level +=1
	Gamestate.load_level()
	

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		$Options.popup_centered()
