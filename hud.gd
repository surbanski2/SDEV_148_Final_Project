extends MarginContainer
	
func update_score(value):
	$HBoxContainer/Score.text = "Score: " + str(value)
	
func update_timer(value):
	$HBoxContainer/RemainingTime.text = "Time: " + str(value)
	
func update_lives(value):
	$HBoxContainer/HBoxContainer/LivesCount.text = str(value)
