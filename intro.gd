extends Panel

func _ready() -> void:
	for i in range(3):
		var tween = create_tween()
		tween.tween_property($intro,"modulate",Color(0,0,0),1).set_delay(2)
		await tween.finished
		$intro.frame += 1
		var tween2 = create_tween()
		tween2.tween_property($intro,"modulate",Color(1,1,1),1).set_delay(0.2)
		await tween2.finished
	var tween3 = create_tween()
	tween3.tween_interval(4)
	tween3.tween_property(self,"modulate:a",0.0,0.4)
	await tween3.finished
	visible = false
	queue_free()
	
