extends Node2D

onready var Player = $Player

func _ready():
	for crate in $Crates.get_child_count():
		$Crates.get_child(crate).connect("blocked", Player, "blocked")


func _on_Goals_victory():
	Gamestate.current_level +=1
	Gamestate.load_level()
