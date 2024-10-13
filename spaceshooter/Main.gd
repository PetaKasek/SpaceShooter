extends Node2D

# Scény hráče, nepřátel a bariér
@export var player_scene: PackedScene = preload("res://Player.tscn")
@export var enemy_scene: PackedScene = preload("res://Enemy.tscn")
@export var barrier_scene: PackedScene = preload("res://Barrier.tscn")

func _ready() -> void:
	spawn_player()
	spawn_enemies()
	spawn_barriers()

func spawn_player() -> void:
	var player = player_scene.instantiate()
	player.position = Vector2(400, 550)  # Střed doleva
	add_child(player)

func spawn_enemies() -> void:
	var rows: int = 5
	var cols: int = 10
	var start_x: float = 100.0
	var start_y: float = 100.0
	var spacing_x: float = 60.0
	var spacing_y: float = 60.0

	for row in range(rows):
		for col in range(cols):
			var enemy = enemy_scene.instantiate()
			enemy.position = Vector2(start_x + col * spacing_x, start_y + row * spacing_y)
			add_child(enemy)

func spawn_barriers() -> void:
	var barrier_positions = [
		Vector2(200, 450),
		Vector2(400, 450),
		Vector2(600, 450)
	]

	for pos in barrier_positions:
		var barrier = barrier_scene.instantiate()
		barrier.position = pos
