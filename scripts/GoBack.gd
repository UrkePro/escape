extends Button

func _on_Back_button_up():
	get_tree().change_scene("res://scenes/menu.tscn")

func _on_Back_mouse_entered():
	$AnimatedSprite.play("redpressed")

func _on_Back_mouse_exited():
	$AnimatedSprite.play("redefault")

func _physics_process(delta):
	$BitCoin/Label.text = str(Global.score)
