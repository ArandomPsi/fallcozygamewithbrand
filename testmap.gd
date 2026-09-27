extends Node2D

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
