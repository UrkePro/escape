extends Button

func _on_Play_button_up():
	#Global.nextLevel()
	Global.loadLevel(1)


func _on_Play_mouse_entered():
	$AnimatedSprite.play("pressed")


func _on_Play_mouse_exited():
	$AnimatedSprite.play("default")
