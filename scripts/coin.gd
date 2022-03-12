extends Area2D

var bdi

func _on_coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	bdi = body

func _on_AnimationPlayer_animation_finished(anim_name):
	bdi.add_coin()
	queue_free()
