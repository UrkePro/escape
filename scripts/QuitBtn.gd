extends Button

func _on_Button2_button_up():
	get_tree().quit()

func _on_Button2_mouse_entered():
	$AnimatedSprite.play("pressed")

func _on_Button2_mouse_exited():
	$AnimatedSprite.play("default")