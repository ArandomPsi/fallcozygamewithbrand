extends Line2D
@export var pos1 : Vector2 = Vector2(850,370)
@export var targetnode : Node2D

func _process(delta: float) -> void:
	clear_points()
	add_point(pos1)
	add_point(targetnode.global_position)
	visible = targetnode.visible
