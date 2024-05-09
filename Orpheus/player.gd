extends CharacterBody2D

var speed : int
var screen_size : Vector2

func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size/ 2
	speed = 200



func get_input():
	#keyboard input
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func _physics_process(delta):
	#player movement
	get_input()
	move_and_slide()
	


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta

	# Handle jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

#	move_and_slide()
