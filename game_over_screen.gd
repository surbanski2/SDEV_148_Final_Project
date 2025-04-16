extends Control

@onready var result = $Message

func _ready():
	if GameState.win == true:
		result.text = "WINNER"
	else:
		result.text = "GAME OVER"

func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_button_pressed():
	GameState.next_level()
