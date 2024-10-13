extends CharacterBody2D

# Rychlost nepřítele
@export var speed: float = 100.0
@export var shoot_probability: float = 0.01  # Pravděpodobnost střelby na jeden frame

# Scéna pro nepřátelské střely
@onready var bullet_scene: PackedScene = preload("res://EnemyBullet.tscn")

func _physics_process(delta: float) -> void:
	# Pohyb nepřítele doprava
	var direction = Vector2.RIGHT
	velocity = direction * speed

	# Aplikace pohybu
	move_and_slide()

	# Odezva na kolizi s hranicí obrazovky
	if position.x > 750:  # Předpokládáme šířku okna 800
		speed = -100.0  # Změna směru na vlevo
		position.y += 40.0  # Posun dolů
	elif position.x < 50:
		speed = 100.0  # Změna směru na vpravo
		position.y += 40.0  # Posun dolů

	# Náhodná střelba
	if randf() < shoot_probability:
		shoot()

func shoot() -> void:
	var bullet = bullet_scene.instantiate()
	bullet.position = position + Vector2(0, 20)  # Střela vychází pod nepřítelem
	get_parent().add_child(bullet)
