extends RigidBody2D

@export var spawn_position : Vector2

@onready var area = $Area2D

enum {ALIVE, DEAD}

var lives = 3
var state = ALIVE
var collidable = true

signal died
signal life_changed(lives)
signal test


func change_state(new_state):
	state = new_state
	match state:
		ALIVE:
			print("Alive")
		DEAD:
			died.emit()
			

func _physics_process(delta):
	var overlapping_bodies = area.get_overlapping_bodies()
	if overlapping_bodies.size() != 0:
		if Input.is_action_pressed("forwards"):
			apply_force(Vector2(1000,0),Vector2.ZERO)
		if Input.is_action_pressed("backwards"):
			apply_force(Vector2(-1000,0), Vector2.ZERO)
		if Input.is_action_pressed("jump"):
			apply_force(Vector2(0,-25000), Vector2.ZERO)
	print(overlapping_bodies)
	
func reset_position():
	print("I'm resetting!")
	position = spawn_position
	collidable = true
	
func lose_life():
	lives -= 1
	if lives < 0:
		change_state(DEAD)
	life_changed.emit(lives)
	test.emit()
	


func _on_area_2d_area_entered(area):
	if collidable == true and area.is_in_group("hazards"):
		print("I'm in the water!")
		collidable = false
		await get_tree().process_frame
		reset_position()
		lose_life()
		
			
			
		
