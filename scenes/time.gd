extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var minutes = int(Game.remain_time) / 60
	var seconds = int(Game.remain_time) % 60
	text = "Tempo restante: " + str(minutes).pad_zeros(1) + ":" + str(seconds).pad_zeros(2)
	Game.update_time(delta)
