extends Area2D

const speed = 100

var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity.x = -speed * delta
	translate(velocity)
	
func _on_Area2D_body_entered(body):
	if body.get_name() == "KinematicBody2D":
		body.damage()
	queue_free()
