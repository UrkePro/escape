extends KinematicBody2D

var health = 100
var damage = 35
var velocity = Vector2()
var side = 2

func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.UP)
	if health <= 0:
		queue_free()
	velocity.y += 10
	$AnimatedSprite.flip_h = side - 1
	if is_on_wall():
		side += 2
	else:
		velocity.x = 50 * side
	if side >= 2:
		side = -1

func _on_Area2D_area_entered(area):
	if area.get_name() == "ammo":
		health -= damage

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		body.damage()
