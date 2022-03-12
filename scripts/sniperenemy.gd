extends KinematicBody2D

const projectile = preload("res://scenes/enemyprojectile.tscn")

var firespeed = 150
var health = 50
var damage = 35

func _ready():
	pass

func _physics_process(delta):
	if health <= 0:
		queue_free()
	firespeed = firespeed - 1
	if firespeed <= 0:
		var Projectile = projectile.instance()
		get_parent().add_child(Projectile)
		firespeed = 150
		Projectile.position = $enemystufidk.global_position

func _on_Area2D2_area_entered(area):
	health = health - damage
