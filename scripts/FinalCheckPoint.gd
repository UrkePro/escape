extends Area2D

func _ready():
	pass

func _on_FinalCheckPoint_body_entered(body):
	if Global.level == 0:
		get_tree().change_scene("res://scenes/menu.tscn")
	else:
		Global.nextLevel()
