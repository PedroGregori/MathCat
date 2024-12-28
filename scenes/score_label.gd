extends Label

func _process(delta: float) -> void:
	if not Game.freeze_game:
		text = str("Score: ", Game.score)
