extends CharacterBody2D


#From Tutorial 
@export var speed = 25
#see if enemy should chase player
var player_chase = false
var player = null


func _physics_process(delta):
	if player_chase:
		position += (player.position - position ) / speed
		

#Is player inside detection area
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

#func _on_detection_area_body_exited(body):
#	player = null
#	player_chase = false

func take_damage():
	queue_free()

func _on_hitbox_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
		
