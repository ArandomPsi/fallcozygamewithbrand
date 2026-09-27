extends Node2D

var mode : int = 0 #title, game

@export var bobber : Node2D
@export var player : Node2D
var lurepower : int = 100

var fishcount : int = 0


func _on_child_entered_tree(node: Node) -> void:
	if node is fishy:
		fishcount += 1
	


func _on_child_exiting_tree(node: Node) -> void:
	if node is fishy:
		fishcount -= 1


func _on_play_pressed() -> void:
	var tween = create_tween()
	tween.tween_property($hud/titlestuff,"position:x",-500,1).set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	$hud/titlestuff.visible = false
	mode = 1
