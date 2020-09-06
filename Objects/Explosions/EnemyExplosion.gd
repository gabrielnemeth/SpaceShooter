extends AnimatedSprite

func _on_EnemyExplosion_animation_finished():
	queue_free()
