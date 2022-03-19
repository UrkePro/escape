extends Control

func _ready():
	_set_hat()

func _physics_process(_delta):
	$Back/BitCoin/Label.text = str(Global.score)
	if Input.is_action_just_pressed("esc"):
		Global.goto_menu()

func _on_Back_button_up():
	Global.goto_menu()

func _on_Back_mouse_entered():
	$Back/AnimatedSprite.play("redpressed")

func _on_Back_mouse_exited():
	$Back/AnimatedSprite.play("redefault")

func _on_hat_select(hat):
	Global.select_hat(hat)
	_set_hat()
	
func _set_hat():
	$HatsDisplay.visible = Global.hat != "default"
	$HatsDisplay.play(Global.hat)
	for hat in Global.hats.keys():
		var anim = $HatBtns.get_node(hat + '/' + "AnimatedSprite")
		if Global.hatown.has(hat):
			anim.play("bluelong")
		if Global.hat == hat:
			anim.play("longgold")
		var price = $HatBtns.get_node(hat + '/' + "price")
		if price:
			price.text = str(Global.hats[hat])
