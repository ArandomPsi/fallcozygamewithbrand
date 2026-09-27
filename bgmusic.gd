extends AudioStreamPlayer
var audiostuff = [("res://Gymnopedie no 1.mp3"),("res://Jupiter from the planets.mp3"), "res://morning mood.mp3","res://your love is my drug.mp3"]



func _on_finished() -> void:
	stream = load(audiostuff.pick_random())
	play()
