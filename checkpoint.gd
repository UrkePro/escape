extends Area2D

func _ready():
	pass

func _on_CheckPoint_body_entered(body):
	$AnimatedSprite.play("active")
	$CPUParticles2D.emitting = true
