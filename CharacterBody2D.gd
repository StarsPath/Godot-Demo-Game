extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var bullet = load("res://projectiles/bullet.tscn")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if vector:
		velocity = vector * SPEED
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.1)

	move_and_slide()
	
func _input(event):
	if Input.is_action_just_pressed("mouse_left_click"):
		print("Mouse Click/Unclick at: ", get_viewport().get_mouse_position())
		var bullet_instance = bullet.instantiate()
		bullet_instance.position = get_viewport().get_mouse_position()
		bullet_instance.linear_velocity = Vector2(100 , 0)
		#bullet_instance.linear_velocity = Vector2(1, 0)
		get_tree().get_root().add_child(bullet_instance)
