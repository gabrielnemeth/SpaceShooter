extends Node

onready var points = $SpawnPoints

var Enemy = preload("res://Enemy/Enemy.tscn")

func _ready():
	get_enemy_pos()

func get_enemy_pos():
	var positions = points.get_children()
	positions.shuffle()
	return positions[0].global_position


func _on_Timer_timeout():
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = get_enemy_pos()
