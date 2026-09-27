extends Node2D

func _ready() -> void:
	timerstuff()


func timerstuff():
	var timer = get_tree().create_timer(randf_range(2,5))
	await timer.timeout
	if get_parent().fishcount < 8:
		var b = preload("res://fish_1.tscn").instantiate()
		get_tree().current_scene.add_child(b)
		b.position = position
		b.position.y += randi_range(-50,50)
	timerstuff()
