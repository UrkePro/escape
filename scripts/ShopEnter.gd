extends Button

func _on_Shop_mouse_entered():
	$AnimatedSprite.play("pressed")

func _on_Shop_mouse_exited():
	$AnimatedSprite.play("default")

func _on_Shop_button_up():
	get_tree().change_scene("res://scenes/shopui.tscn")
