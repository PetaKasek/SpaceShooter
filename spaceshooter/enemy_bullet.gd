extends Area2D

# Rychlost střely
@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	position += Vector2.DOWN * speed * delta  # Pohyb střely dolů
	if position.y > 600:  # Pokud střela vyjede mimo obrazovku
		queue_free()

# Kolize se správcem bariéry nebo hráče
func _on_EnemyBullet_body_entered(body: Node) -> void:
	if body.name == "Player" or body.name == "Barrier":
		queue_free()  # Zničí střelu při zásahu
