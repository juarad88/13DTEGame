extends Node2D

@onready var Enemy_scene = preload("res://Enemy.tscn")
var count = 16
@onready var spawn_location = $spawn_location



func _on_area_2d_body_entered(body):
	if count > 1:
		$CooldownTimer.start()
	else:
		pass
		

func _on_cooldown_timer_timeout():
	if count >1:
		var Enemy = Enemy_scene.instantiate() #create a enemy
		Enemy.global_position = spawn_location.global_position
		add_sibling(Enemy) #add the enemy to the scene
		count -= 1
		$CooldownTimer.start()
	else:
		pass

