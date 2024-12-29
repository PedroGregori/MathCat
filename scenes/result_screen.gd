extends Node2D

@onready var perfect_label: Label = $Control/Perfect_Label
@onready var good_label: Label = $Control/Good_Label
@onready var bad_label: Label = $Control/Bad_Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	perfect_label.text = str("PERFEITO: ", Game.perfect)
	good_label.text = str("BOM: ", Game.good)
	bad_label.text = str("RUIM: ", Game.bad)

func _input(event: InputEvent) -> void:
	if Game.freeze_game:
		if event.is_action_pressed("resetbonus"):
			Game.restart_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
