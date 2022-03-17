extends Control

func _on_Shop_mouse_entered():
	$Shop/AnimatedSprite.play("pressed")
		
func _on_Shop_mouse_exited():
	$Shop/AnimatedSprite.play("default")

func _on_Shop_button_up():
	get_tree().change_scene("res://scenes/shop.tscn")
