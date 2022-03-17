extends Control

func _ready():
	_set_hat()

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
