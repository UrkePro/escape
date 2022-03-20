extends KinematicBody2D

var velocity = Vector2()
var side = 1
var posy = 0

func _ready():
	posy = position.y

func _physics_process(_delta):
	if is_on_wall():
		side *= -1
	velocity.x = 50 * side
	velocity = move_and_slide(velocity, Vector2.UP)
	position.y = posy
