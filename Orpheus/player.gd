extends CharacterBody2D

var speed : int
var screen_size : Vector2

@onready var bullet_scene = preload("res://bullet.tscn")

func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size/ 2
	speed = 100

func shoot():
	var bullet = bullet_scene.instantiate() #create a bullet
	get_parent().add_child(bullet) #add the bullet to the scene
	bullet.global_position = global_position #set the bullet position
	bullet.look_at(get_global_mouse_position()) #rotate bullet to look at mouse

func get_input():
	#keyboard input
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func _physics_process(delta):
	#player movement
	get_input()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	move_and_slide()
	$LightPivot.look_at(get_global_mouse_position())
	
	#player rotation
	var mouse = get_local_mouse_position()
	var angle = snappedf(mouse.angle(), PI / 4) / (PI/4)
	angle = wrapi(int(angle), 0, 8)
	
	$AnimatedSprite2D.animation = "walk" + str(angle)
	
	#player animation
	if velocity.length() != 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1

func kill():
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		kill()
