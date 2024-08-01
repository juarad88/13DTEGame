extends Node2D

@onready var Enemy_scene = preload("res://Scenes/Enemy.tscn")
var count = 51
@onready var spawn_location = $spawn_location
@onready var area = $Area2D
@export var radius = 2000
@onready var marker = $spawn_location

func _on_area_2d_body_entered(body):
	if count > 1:
		$CooldownTimer.start()
	else:
		pass
		
func get_point():
	var point = Vector2(randi_range(-radius, radius), randi_range(-radius,radius))
	return point
	
func generate_random_point_on_circle():
# Generate a random angle
	var theta = randf_range(0, 2 * PI)
	var x = radius * cos(theta)
	var y = radius * sin(theta)
	marker.position = Vector2(x, y)
	

func spawn_enemy():
	var Enemy = Enemy_scene.instantiate() #create a enemy
	Enemy.global_position = marker.global_position#spawn_location.global_position
	add_sibling(Enemy)
	
func _on_cooldown_timer_timeout():
	if count >1:
		generate_random_point_on_circle()
		spawn_enemy()
		#var Enemy = Enemy_scene.instantiate() #create a enemy
		#var point = Vector2.ZERO
		#while true:
			#point = get_point()
			#if point.length() < radius:
				#point = point+global_position
				#break
		#Enemy.global_position = point#spawn_location.global_position
		#add_sibling(Enemy) #add the enemy to the scene
		count -= 1
		$CooldownTimer.start()
	else:
		pass

