extends Node2D

@onready var Enemy_scene = preload("res://Enemy.tscn")
var count = 16


func _on_area_2d_body_entered(body):
	if count > 1:
		$CooldownTimer.start()
	else:
		pass
		

func _on_cooldown_timer_timeout():
	if count >1:
		var Enemy = Enemy_scene.instantiate() #create a enemy
		get_parent().add_child(Enemy) #add the enemy to the scene
		count -= 1
	else:
		pass

