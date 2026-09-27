extends Sprite2D
var velocity : Vector2
var z : float = 0
var zvel : float = 0

var trueposition : Vector2

var lastz : float

func _process(delta: float) -> void:
	
	if visible:
		trueposition += velocity * delta
		if z >= 0:
			velocity *= 0.95
		
		#pseudo 3d movement
		zvel += 20
	
	
	z += zvel * delta
	
	
	
	z = clamp(z,-999,60)
	
	if z == 60 and not lastz == 60:
		splishysplashy()
	
	position = trueposition + Vector2(0,z)/5
	
	lastz = z
	
	
	
	


func splishysplashy():
	var b = preload("res://waterpar.tscn").instantiate()
	get_tree().current_scene.add_child(b)
	b.position = global_position

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
	
	#get the fish and delete it
	var lastcapturedfish = bobbertakeallfish()
	if not lastcapturedfish == null:
		createfish(lastcapturedfish.fishname)
		lastcapturedfish.queue_free()
	else:
		get_parent().labelstuff("nothing")
	getparentstuff()
	
	for i in range(10):
		position.x = lerp(position.x, -10.0, 0.2)
		await get_tree().process_frame
	
	visible = false
	velocity = Vector2(0,0)


func createfish(fishname : String):
	var b = preload("res://fishpreview.tscn").instantiate()
	b.position = global_position
	b.targetpos = Vector2(865,375)
	get_tree().current_scene.add_child(b)
	get_parent().labelstuff("You caught: " + fishname)
	if not fishname in global.fishcaught:
		global.fishcaught.push_back(fishname)

func bobbertakeallfish() -> fishy:
	var areas: Array = $Area2D.get_overlapping_areas()
	var closest_area: Area2D = null
	var closest_distance := INF
	
	for area in areas:
		var distance = global_position.distance_to(area.global_position)
	
		if distance < closest_distance:
			closest_distance = distance
			closest_area = area
	
	if closest_area:
		return closest_area.get_parent()
	
	return null


func getparentstuff():
	get_parent().camzoom()
	get_parent().inputcooldown = 50
	get_parent().stop()
	await get_tree().process_frame
	get_parent().play("fishpullout")
	await get_parent().animation_finished
	get_parent().state = 0


func _on_area_2d_2_body_entered(area: Area2D) -> void:
	if z > 59:
		var prevrota : float = rotation
		look_at(area.global_position)
		velocity += transform.x * -10
		rotation = prevrota
