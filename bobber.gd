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
	
	z = clamp(z,-999,20)
	
	
	position = trueposition + Vector2(0,z)/5
	
	print(str(z) + "," + str(zvel))
	

func launchbobber():
	print("yes")
	visible = true
	position = Vector2(0,0)
	
	zvel = -500
	z = -5
	velocity = Vector2(-50,0)

func bobberreelin():
	look_at(get_parent().global_position)
	velocity = transform.x * 20 * Vector2(1,0)
	rotation_degrees = 0
	if global_position.distance_to(get_parent().global_position) < 150:
		bobberpullback()


func bobberpullback():
	zvel = -200
	for i in range(10):
		position.x = lerp(position.x,0.0,0.1)
		await get_tree().process_frame
	visible = false
	#reset the state
	get_parent().state = 0
