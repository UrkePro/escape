extends Control

func _on_Play_button_up():
	if Global.level == 0:
		Global.level = 1
	Global.loadLevel()

func _on_Play_mouse_entered():
	$Play/AnimatedSprite.play("pressed")

func _on_Play_mouse_exited():
	$Play/AnimatedSprite.play("default")

func _on_Quit_button_up():
	Global.save_game()
	get_tree().quit()

func _on_Quit_mouse_entered():
	$Quit/AnimatedSprite.play("pressed")

func _on_Quit_mouse_exited():
	$Quit/AnimatedSprite.play("default")

func _on_Tutorial_button_up():
	Global.loadLevel(0)

func _on_Tutorial_mouse_entered():
	$Tutorial/AnimatedSprite.play("pressed")

func _on_Tutorial_mouse_exited():
	$Tutorial/AnimatedSprite.play("default")

func _on_Shop_mouse_entered():
	$Shop/AnimatedSprite.play("pressed")
		
func _on_Shop_mouse_exited():
	$Shop/AnimatedSprite.play("default")

func _on_Shop_button_up():
	get_tree().change_scene("res://scenes/shop.tscn")
