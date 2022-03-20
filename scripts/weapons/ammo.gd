extends Area2D

const speed = 300
var velocity = Vector2()
var side = 0

func _ready():
	$Sprite.flip_h = Global.side
	side = Global.side
func _physics_process(delta):
	if side == true:
		velocity.x = speed * -delta
	else:
		velocity.x = speed * delta
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_ammo_body_entered(body):
	queue_free()
