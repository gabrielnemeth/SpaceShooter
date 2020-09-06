extends KinematicBody2D

export(int) var armor = 3
export(int) var SPEED = 5

var HitLight = preload("res://Objects/HitLights/EnemyHitlight.tscn")
var Explosion = preload("res://Objects/Explosions/EnemyExplosion.tscn")

func _physics_process(delta):
	position.x -= SPEED

func _on_Hurtbox_area_entered(area):
	var hitLight = HitLight.instance()
	var main = get_tree().current_scene
	main.add_child(hitLight)
	hitLight.global_position = area.global_position
	hitLight.play("hit")

	area.queue_free()
	armor -= 1
	if armor == 0:
		var explosion = Explosion.instance()
		main.add_child(explosion)
		explosion.global_position = global_position
		explosion.play("explosion")
		queue_free()


func _on_Hurtbox_body_entered(body):
	body.queue_free()
	queue_free()
