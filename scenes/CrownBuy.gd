extends Button

func _on_Crown_button_up():
	if Global.score >= 100:
		Global.crown = true
		Global.score -= 100
		$HatsDisplay.play("crown")
		$AnimatedSprite.play("gold")
