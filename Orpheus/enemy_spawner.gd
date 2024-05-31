extends Node2D

#from https://www.youtube.com/watch?v=m8sswbLIiR0, up to 10:09

@export var spawns: Array[Spawn_info] = []

@onready var player = get_tree().get_first_node_in_group("player")

var time = 0

func _on_timer_timeout():
	time += 1
	var enemy_spanws = spawns
	for i in enemy_spanws:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = load(str(i.enemy.resource_path))
				var counter = 0
				while counter < i.enemy_num:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = get_random_position()
					
func get_random_position():
	pass
