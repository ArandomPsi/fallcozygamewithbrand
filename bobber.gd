extends Sprite2D
var velocity : Vector2
var z : float = 0
var zvel : float = 0

var trueposition : Vector2

func _process(delta: float) -> void:
	
	if visible:
		trueposition += velocity * delta
		if z >= 0:
			velocity *= 0.95
		
		#pseudo 3d movement
		zvel += 20
	
	
	z += zvel * delta
	
	z = clamp(z,-999,60)
	
	
	position = trueposition + Vector2(0,z)/5
	
	
	

func launchbobber():
	print("yes")
	visible = true
	position = Vector2(0,0)
	trueposition = position
	
	
	zvel = -500
	z = -5
	
	
	velocity = Vector2(randi_range(-30,-70),0)

func bobberreelin():
	look_at(get_parent().global_position)
	velocity = transform.x * 20 * Vector2(1,0)
	rotation_degrees = 0
	if global_position.distance_to(get_parent().global_position) < 200:
		bobberpullback()


func bobberpullback():
	zvel = -500
	
	getparentstuff()
	
	for i in range(10):
		position.x = lerp(position.x, -10.0, 0.2)
		await get_tree().process_frame
	
	visible = false

func getparentstuff():
	
	get_parent().inputcooldown = 50
	get_parent().stop()
	get_parent().play("fishpullout")
	await get_parent().animation_finished
	get_parent().state = 0
