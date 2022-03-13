extends Area2D

func _ready():
	pass

func _on_FinalCheckPoint_body_entered(body):
	Global.nextLevel()
