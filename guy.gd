extends AnimatedSprite2D
var state : int = 0 #prep, fishing, pulling fish
var inputcooldown : int = 0

@export var label : Label

func _process(delta: float) -> void:
	inputcooldown -= 1
	inputcooldown = clamp(inputcooldown,-1,999)
	if state == 1:
		fishingcontrols()
	else:
		prepcontrols()
	global.ggmp = get_global_mouse_position()



func prepcontrols():
	
	if inputcooldown < 1:
		if Input.is_action_pressed("fish"):
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

func labelstuff(text):
	label.text = text
	label.modulate.a = 1.0
	label.visible = true
	var tween = create_tween()
	tween.tween_property(label,"modulate:a",0.0,0.5).set_delay(2)
	await tween.finished
	label.visible = false

func camzoom():
	print("yo")
	var tween = create_tween()
	tween.tween_property($Camera2D, "zoom",Vector2(2.5,2.5),0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($Camera2D, "zoom",Vector2(1.0,1.0),0.5).set_trans(Tween.TRANS_CUBIC).set_delay(1.5)
