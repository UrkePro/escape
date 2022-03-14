extends KinematicBody2D

const speed = 100
const jumpforce = 300
const gravity = 10
const ammo = preload("res://scenes//ammo.tscn")

var lives = 3
var velocity = Vector2(0,0)
var countjumps = 0
var keylr = 0
var wallside = 0
var rotate = 0
var isrotated = 0
var coins = 0
var firespeed = 0
var ammocount = 8
var pistol = false
var Crown = Global.crown
var checkpoint = [0,0]

func _ready():
	$coins.text = str(coins)

func _physics_process(_delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene("res://scenes/menu.tscn")
	OS.set_window_fullscreen(true)
	Global.side = $Sprite.flip_h
	if lives <= 0:
		Global.loadLevel()
	$ammo.text = str(ammocount,"/8")
	firespeed = firespeed - 1
	if Input.is_action_pressed("Rload") and ammocount < 8:
		firespeed = 120
		ammocount = 8
	if pistol == true:
		$ammo.visible = true
	else:
		$ammo.visible = false
	if Crown == true:
		$Sprite/Hats.visible = true
		if is_on_wall() and not is_on_floor():
			$Sprite/Hats.play("Crown_wall")
			if not keylr == 0:
				$Sprite/Hats.flip_h = keylr - 1
		else:
			$Sprite/Hats.play("Crown_idle")
	else:
		$Sprite/Hats.visible = false

	keylr = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	velocity.x = keylr * speed
	match pistol:
		false:
			if not keylr ==0:
				$Sprite.play("walk")
			else :
				$Sprite.play("idle")
			if not is_on_floor():
				$Sprite.play("air")
			if is_on_wall() and not is_on_floor():
				$Sprite.play("wall_jump")
		true:
			if not keylr ==0:
				$Sprite.play("walk_pistol")
			else :
				$Sprite.play("idle_pistol")
			if not is_on_floor():
				$Sprite.play("air_pistol")
			if is_on_wall() and not is_on_floor():
				$Sprite.play("wall_jump_pistol")
	if keylr != 0:
		$Sprite.flip_h = keylr < 0
		$Position2D.position.x = 30 * keylr

	if Input.is_action_pressed("Fire") and firespeed <= 0 and ammocount > 0 and pistol == true:
		var Ammo = ammo.instance()
		firespeed = 30
		ammocount = ammocount - 1
		get_parent().add_child(Ammo)
		Ammo.position = $Position2D.global_position

	velocity.y += gravity
	spin()
	if Input.is_action_just_pressed("jump"):
		if is_on_wall() and wallside != keylr:
			countjumps = 1
			wallside = keylr
		if countjumps > 0:
			velocity.y = -jumpforce
			countjumps -= 1
	if is_on_floor():
		countjumps = 1
		isrotated = 0
	if is_on_floor() or is_on_wall():
		$Sprite.rotation_degrees = 360
		isrotated = 0
	if lives == 2:
		$hearts1.play("-1heart")
	if lives == 1:
		$hearts2.play("-1heart")
		
	velocity = move_and_slide(velocity, Vector2.UP)
func spin():
	if countjumps <= 0:
		$Sprite.rotation_degrees = rotate
		if isrotated == 0:
			rotate += 12
	if rotate > 359:
		rotate = 0
		isrotated = 1

func add_coin():
	coins = coins + 1
	$coins.text = str(coins)
	
func _on_Pistol_body_entered(body):
	pistol = true

func _on_CheckPoint_body_entered(body):
	checkpoint[0] = position.x
	checkpoint[1] = position.y

func damage():
	position.x = checkpoint[0]
	position.y = checkpoint[1]
	lives -= 1
	
func _on_FallZone_body_entered(body):
	damage()

func _on_Area2D_body_entered(body):
	damage()
	
func _on_Area2D_area_entered(area):
	damage()

func _on_EnemyProjectile_body_entered(body):
	damage()

func _on_Death_lol_body_entered(body):
	damage()

func _on_FinalCheckPoint_body_entered(body):
	Global.score += coins
