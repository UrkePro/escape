extends Area2D

func _ready():
	pass

func _on_Ak_47_body_entered(body):
	queue_free()
