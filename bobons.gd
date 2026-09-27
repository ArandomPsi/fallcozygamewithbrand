extends Button

var basesizex : float = 150

func _ready() -> void:
	basesizex = size.x

func _process(delta: float) -> void:
	if visible:
		if is_hovered():
			size.x = lerp(size.x,basesizex * 1.25,0.2)
		else:
			size.x = lerp(size.x,basesizex,0.2)
