extends CanvasLayer
var fish : Array
func _process(delta: float) -> void:
	if get_parent().mode == 1:
		if global.ggmp.x < 200:
			$fishdex.position.x = lerp($fishdex.position.x,0.0,0.2)
		else:
			$fishdex.position.x = lerp($fishdex.position.x - 150.0,0.0,0.2)
		
		if not fish == global.fishcaught:
			fish = global.fishcaught.duplicate()
			$fishdex/RichTextLabel.text = ""
			$fishdex/RichTextLabel.text = "fish caught - " + str(fish.size()) + "/18\n"
			for i in range(global.fishcaught.size()):
				var rarity = "common"
				if global.fishcaught[i] in global.rare:
					rarity = "[color=blue]rare[/color]"
				elif global.fishcaught[i] in global.legendary:
					rarity = "[color=yellow]legendary[/color]"
				$fishdex/RichTextLabel.text += "-" + global.fishcaught[i] + " - " + rarity + "\n"
			
	
