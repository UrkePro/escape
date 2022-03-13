extends Area2D

const speed = 100

var velocity = Vector2()

func _physics_process(delta):
	velocity.x = speed * delta
	translate(velocity)

func _on_EnemyProjectile_body_entered(body):
	if body.get_name() == "Player":
		body.damage()
	queue_free()
