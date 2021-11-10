extends Node2D

onready var Player = $Player

func _ready():
	for crate in $Crates.get_child_count():
		$Crates.get_child(crate).connect("blocked", Player, "blocked")
