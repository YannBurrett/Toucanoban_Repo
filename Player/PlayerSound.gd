extends AudioStreamPlayer

export (Array, Resource) var sounds

func _ready():
	randomize()


func play_sound():
	var sound = sounds[randi() %sounds.size() -1]
	stream = sound
	play()
