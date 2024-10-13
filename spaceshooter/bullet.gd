extends Area2D

# Rychlost střely
@export var speed: float = 100.0

func _physics_process(delta: float) -> void:
	position += Vector2.UP * speed * delta  # Pohyb nahoru
	if position.y < 0:
		queue_free()  # Odstranění střely mimo obrazovku

# Detekce kolize
func _on_Bullet_body_entered(body: Node) -> void:
	if body is CharacterBody2D and body.name == "Enemy":
		body.queue_free()  # Odstranění nepřítele
		queue_free()       # Odstranění střely
