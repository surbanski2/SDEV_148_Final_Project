extends Node2D

var score = 0
var time_left = 60

func _ready():
	$Player.spawn_position = $SpawnPoint.global_position
	$GameTimer.start()
	$CanvasLayer/HUD.update_score(score)
	for star in get_tree().get_nodes_in_group("stars"):
		star.connect("pickedup", Callable(self, "_on_star_collected"))
	for skull in get_tree().get_nodes_in_group("skulls"):
		skull.connect("skullpickedup", Callable(self, "_on_skull_collected"))
	$Player.reset_position()
	$CanvasLayer/HUD.update_lives($Player.lives)
	
	
func game_over():
	GameState.restart()


func _on_game_timer_timeout():
	time_left -= 1
	$CanvasLayer/HUD.update_timer(time_left)
	if time_left <= 0:
		$Player.lose_life()
		$Player.reset_position()
		$CanvasLayer/HUD.update_lives($Player.lives)
		reset_timer()
		
		
func _on_star_collected():
	score += 1
	$CanvasLayer/HUD.update_score(score)
	
func _on_skull_collected():
	score -= 1
	$CanvasLayer/HUD.update_score(score)
	

func reset_timer():
	print("I'm resetting the time!")
	time_left = 60
	$CanvasLayer/HUD.update_timer(time_left)
	
func _process(delta):
	if $Player.position.x > 12000:
		GameState.next_level()

	
