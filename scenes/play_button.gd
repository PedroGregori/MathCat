extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if NormalModeGlobal.operations.is_empty():
		disabled = true
	else:
		disabled = false
