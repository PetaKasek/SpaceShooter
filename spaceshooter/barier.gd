extends StaticBody2D

# Detekce kolize s nepřátelskou střelou
func _on_Barrier_body_entered(body: Node) -> void:
	if body.name == "EnemyBullet":
		queue_free()  # Zničí bariéru při zásahu střelou
		body.queue_free()  # Zničí také střelu
