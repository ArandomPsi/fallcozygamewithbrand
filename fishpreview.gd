extends Node2D
@export var targetpos : Vector2



func _ready() -> void:
	var ogpos : Vector2 = position
	var tween = create_tween()
	tween.tween_property(self, "position:x", targetpos.x, 0.6)
	tween.parallel().tween_property(self, "position:y", targetpos.y - 100, 0.4).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "position:y", targetpos.y, 0.4).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT).set_delay(0.4)
	tween.parallel().tween_property($Sprite2D,"rotation", TAU*2,0.6).set_trans(Tween.TRANS_CUBIC)
	
	tween.tween_interval(1.2)
	tween.tween_property(self,"position",targetpos + Vector2(600,30),0.4)
	await tween.finished
	queue_free()
