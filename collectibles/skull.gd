extends Area2D

signal skullpickedup

var collected

func _on_body_entered(body):
	if collected:
		return
	collected = true
	$AudioStreamPlayer.play()
	$Sprite2D.visible = false
	skullpickedup.emit()
	await $AudioStreamPlayer.finished
	queue_free()
