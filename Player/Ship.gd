extends KinematicBody2D

export(int) var SPEED: int = 650
export(float) var FRICTION = 0.05
export(float) var ACCELERATION = 0.1

var velocity: Vector2 = Vector2()

const Bullet = preload("res://Objects/Bullets/Bullet.tscn")

func get_input() -> int:
	var input = Vector2()
	if Input.is_action_pressed("up"):
		input.y -= 1
	if Input.is_action_pressed("down"):
		input.y += 1
	if Input.is_action_pressed("left"):
		input.x -= 1
	if Input.is_action_pressed("right"):
		input.x += 1
	return input
	
func shoot():
	if Input.is_action_just_pressed("shoot"):
		var bullet = Bullet.instance()
		var main = get_tree().current_scene
		main.add_child(bullet)
		bullet.global_position = global_position

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * SPEED, ACCELERATION)
	else:
		velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	velocity = move_and_slide(velocity)
	
	shoot()
	
	
	
	
	
	
	
	
