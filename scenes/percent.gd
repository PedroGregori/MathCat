extends Label

func _process(delta: float) -> void:
	text = "%.2f" % Game.percent + "%"
	Game.update_percent()
