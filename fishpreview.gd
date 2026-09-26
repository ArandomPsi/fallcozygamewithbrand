extends Node2D
@export var targetpos : Vector2
func _ready() -> void:
	var ogpos : Vector2 = position
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2((ogpos.x + targetpos.x)/2,targetpos.y - 100),0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self,"position",Vector2(targetpos.x,targetpos.y),0.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_interval(1)
	tween.tween_property(self,"position",targetpos + Vector2(300,-10),0.4).set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	queue_free()
