extends Node2D
@onready var game_over_label: Label = $GameOver_Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if Game.freeze_game:
		if event.is_action_pressed("resetbonus"):
			Game.restart_game()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
