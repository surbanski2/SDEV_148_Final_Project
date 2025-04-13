extends Node

extends CharacterBody2D




@export var spawn_position : Vector2


var state = ALIVE
var lives = 3




		
		

		

		
				
func _on_area_2d_area_entered(area):
	if area.is_in_group("hazards"):
		lose_life()
		reset_position()
	
func reset_position():
	position = spawn_position
	
