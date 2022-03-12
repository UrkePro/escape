extends Button

func _ready():
	pass

func _on_Button_button_up():
	get_tree().change_scene("res://scenes/yourmom.tscn")

func _on_Button_mouse_entered():
	$AnimatedSprite.play("pressed")

func _on_Button_mouse_exited():
	$AnimatedSprite.play("default")
