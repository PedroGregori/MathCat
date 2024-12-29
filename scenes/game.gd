extends Node2D

@onready var score_label: Label = $ScoreLabel
@onready var time: Label = $Time
@onready var path_follow_2d: PathFollow2D = $"Precision Bar/Path2D/PathFollow2D"

var score = 0
var percent = 100
var perfect = 0
var good = 0
var bad = 0
var error = 0
var combo = 0
var perfect_weight = 1
var good_weight = 0.5
var bad_weight = 0
var remain_time = 5
var time_decrement_speed = 1
var freeze_game = false
var game_over_screen = preload("res://scenes/game_over.tscn")

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
			if score > 0:
				freeze_game = true
				get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
			else:
				freeze_game = true
				get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		elif error >= 5:
			if score > 0:
				freeze_game = true
				get_tree().change_scene_to_file("res://scenes/result_screen.tscn")
			else:
				freeze_game = true
				get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	else:
		pass

func restart_game():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	freeze_game = false
	remain_time = 5
	error = 0
	score = 0
	percent = 100
	perfect = 0
	good = 0
	bad = 0


func _process(delta: float) -> void:
	game_over()
