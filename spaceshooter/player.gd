extends CharacterBody2D

# Rychlost hráče
@export var speed: float = 300.0

# Scéna projektilu
@onready var bullet_scene: PackedScene = preload("res://Bullet.tscn")

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	# Pohyb doleva
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	# Pohyb doprava
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Normalizace směru a aplikace rychlosti
	direction = direction.normalized()
	velocity.x = direction.x * speed

	# Aplikace pohybu
	move_and_slide()

	# Střelba
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.position = position + Vector2(0, -20)  # Pozice střely nad hráčem
	get_parent().add_child(bullet)
