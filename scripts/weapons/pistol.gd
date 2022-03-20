extends Area2D

func _on_Pistol_body_entered(body):
	queue_free()
