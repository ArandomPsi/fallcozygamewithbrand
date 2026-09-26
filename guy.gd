extends AnimatedSprite2D
var state : int = 0 #prep, fishing, pulling fish
var inputcooldown : int = 0



func _process(delta: float) -> void:
	inputcooldown -= 1
	inputcooldown = clamp(inputcooldown,-1,999)
	if state == 1:
		fishingcontrols()
	else:
		prepcontrols()



func prepcontrols():
	
	if inputcooldown < 1:
		if Input.is_action_just_pressed("fish"):
			play("fishaim")
		if Input.is_action_just_released("fish"):
			play("fishreel")
			state = 1
			$bobber.launchbobber()
			

func fishingcontrols():
	if inputcooldown < 1:
		if Input.is_action_just_pressed("fish"):
			inputcooldown = 5
			$bobber.bobberreelin()
			play("fishpull")
			


func _on_animation_finished() -> void:
	if state == 0:
		play("idle")
