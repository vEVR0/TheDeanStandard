extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var leftright := Input.get_axis("left", "right")
	if leftright:
		velocity.x = leftright * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var updown := Input.get_axis("up", "down")
	if updown:
		velocity.y = updown * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
