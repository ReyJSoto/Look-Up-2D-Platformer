extends CharacterBody2D

const SPEED = 200.0
var JUMP_VELOCITY = -300.0

func respawn():
	self.global_position = Vector2(-27, 38)
	set_process_input(true)
	set_physics_process(true)

func jumpBoost():
	JUMP_VELOCITY = -500.0

func regularJump():
	JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$PlayerSprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	set_process_input(false)
	set_physics_process(false)
