extends Node2D
@export var targetpos : Vector2
@onready var sprite = $Sprite2D
var tinygoldenfish = Rect2(100,11,7,5)
var tinyplainfish = Rect2(116,11,7,5)
var mediumfish = Rect2(99,25,9,7)
var largeyellowfish = Rect2(131,9,9,7)
var largeplainfish = Rect2(147,9,9,7)
var shark = Rect2(114,19,27,13)
var swordfish = Rect2(146,20,28,10)
var colecanath = Rect2(160,1,30,14)

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
