extends Button

func _ready():
	pass

func _on_Button_button_up():
	Global.loadLevel(0)

func _on_Button_mouse_entered():
	$AnimatedSprite.play("pressed")

func _on_Button_mouse_exited():
	$AnimatedSprite.play("default")
