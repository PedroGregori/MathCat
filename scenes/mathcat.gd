extends Node2D

var current_scene = null
var menu_scene = preload("res://scenes/mathcat.tscn")
var mode_selection_scene = preload("res://scenes/modes.tscn")

func switch_to_scene(new_scene):
	if current_scene:
		remove_child(current_scene)
	add_child(new_scene)
	current_scene = new_scene
