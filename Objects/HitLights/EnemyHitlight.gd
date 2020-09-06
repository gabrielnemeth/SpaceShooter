extends AnimatedSprite


func _on_EnemyHitlight_animation_finished():
	queue_free()
