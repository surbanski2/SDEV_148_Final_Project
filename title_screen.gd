extends Control



func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_button_pressed():
	GameState.next_level()
