extends Node2D

@onready var score_label: Label = $ScoreLabel
@onready var time: Label = $Time

var score = 0
var percent = 100
var perfect = 0
var good = 0
var bad = 0
var perfect_weight = 1
var good_weight = 0.5
var bad_weight = 0
var remain_time = 5
var time_decrement_speed = 1
var freeze_game = false

func update_percent():
	if not freeze_game:
		var total = perfect + good + bad
		if total > 0:
			percent = (((perfect * perfect_weight) + (good * good_weight) + (bad * bad_weight)) / total) * 100
		else:
			percent = 100

func update_time(delta: float):
	if not freeze_game:
		remain_time -= time_decrement_speed * delta

func game_over():
	if not freeze_game:
		if remain_time <= 0:
			freeze_game = true
	else:
		pass

func restart_game():
	freeze_game = false
	print("Jogo reiniciado!")
	remain_time = 5
	score = 0
	percent = 100
	
func _input(event: InputEvent) -> void:
	if freeze_game:
		if event.is_action_pressed("resetbonus"):
			restart_game()

func _process(delta: float) -> void:
	game_over()
