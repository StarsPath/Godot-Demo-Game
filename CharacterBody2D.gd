extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
#
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if vector:
		velocity = vector * SPEED
	elif not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.1)

	move_and_slide()
