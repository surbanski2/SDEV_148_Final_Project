extends Node

var num_levels = 2
var current_level = 0

var game_scene = "res://main.tscn"
var title_screen = "res://title_screen.tscn"
var game_finished = "res://game_over_screen.tscn"

var win = false

func restart():
	current_level = 0
	get_tree().change_scene_to_file(title_screen)
	
	
func next_level():
	current_level += 1
	if current_level <= num_levels:
		get_tree().change_scene_to_file(game_scene)
	else:
		winner()
		
func game_over():
	current_level = 0
	win = false
	get_tree().change_scene_to_file(game_finished)

func winner():
	current_level = 0
	win = true
	get_tree().change_scene_to_file(game_finished)
