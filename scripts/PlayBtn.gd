extends Button

func _on_Play_button_up():
	if Global.level == 0:
		Global.level = 1
	Global.loadLevel()


func _on_Play_mouse_entered():
	$AnimatedSprite.play("pressed")


func _on_Play_mouse_exited():
	$AnimatedSprite.play("default")
