extends Node2D

var velocity : Vector2
var state : int = 0

func _process(delta: float) -> void:
	position += velocity * delta
	updatevisuals()
	velocity *= 0.999999
	if state == 0:
		donothing()
	else:
		omnomnom()


func updatevisuals():
	if velocity.x > 0:
		$sprite.flip_h = false
	else:
		$sprite.flip_h = true

func donothing():
	
	
	if position.x < 50:
		velocity.x += 10
	
	if position.x > 900:
		velocity.x -= 10
	
	if position.y < 325:
		velocity.y += 10
	
	if position.y > 600:
		velocity.y -= 10
	
	
	position.y = clamp(position.y,275,650)
	
	if position.distance_to(get_parent().bobber.global_position) < get_parent().lurepower:
		state = 1
	
	print(str(position.distance_to(get_parent().bobber.global_position)))
	

func omnomnom():
	if position.distance_to(get_parent().bobber.global_position) < get_parent().lurepower * 1.5:
		state = 0
	
	$pivot.look_at(get_parent().bobber.global_position)
	velocity += $pivot.transform.x * 10
	
	


func _on_timer_timeout() -> void:
	$Timer.start(randf_range(3,6))
	if state == 0:
		var randomvector : Vector2 = Vector2(randf_range(-10,10),randf_range(-10,10))
		for i in range(20):
			velocity += randomvector
			await get_tree().process_frame
