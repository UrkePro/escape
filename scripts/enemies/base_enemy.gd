extends KinematicBody2D

const projectile = preload("res://scenes/enemies/projectile.tscn")

var health = 100
var speed = 50
var damage = 35
var velocity = Vector2()
var side = 1

func _physics_process(_delta):
	if health <= 0:
		queue_free()
	velocity.y += 10
	$AnimatedSprite.flip_h = side - 1
	if is_on_wall():
		side *= -1
	velocity.x = speed * side
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_area_entered(area):
	if area.get_name() == "ammo":
		health -= damage

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		body.damage()

func shoot():
	var Projectile = projectile.instance()
	add_child(Projectile)
	Projectile.position = $enemystufidk.position
