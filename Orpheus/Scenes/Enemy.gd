extends CharacterBody2D


#From Tutorial 
@export var speed = 50
#see if enemy should chase player
var player_chase = false
@onready var player = get_tree().get_first_node_in_group("Player")


func _physics_process(delta):
	if player_chase:
		velocity = (player.global_position - global_position).normalized() * speed
	move_and_slide()
		
		

#Is player inside detection area
func _on_detection_area_body_entered(body):
	player_chase = true

#func _on_detection_area_body_exited(body):
#	player = null
#	player_chase = false

func take_damage():
	queue_free()

func _on_hitbox_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
		