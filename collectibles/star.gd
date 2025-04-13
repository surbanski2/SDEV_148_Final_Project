extends Area2D

signal pickedup

var collected

func _on_body_entered(body):
	if collected:
		return
	collected = true
	$AudioStreamPlayer.play()
	$Sprite2D.visible = false
	pickedup.emit()
	await $AudioStreamPlayer.finished
	queue_free()



	
