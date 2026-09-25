extends AnimatedSprite2D
var state : int = 0 #prep, fishing, pulling fish

func _process(delta: float) -> void:
	if state == 1:
		fishingcontrols()
	else:
		prepcontrols()


func prepcontrols():
	if Input.is_action_just_pressed("fish"):
		state = 1
		$bobber.launchbobber()

func fishingcontrols():
	if Input.is_action_just_pressed("fish"):
		$bobber.bobberreelin()
