extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	
	
	var leftright := Input.get_axis("left", "right")
	print(leftright)
	if leftright:
		velocity.x = leftright * SPEED
		if leftright > 0:
			animated_sprite_2d.flip_h = false
		else:
			animated_sprite_2d.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	var updown := Input.get_axis("up", "down")
	
	
	
	if updown:
		velocity.y = updown * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if updown == -1.0:
		animated_sprite_2d.play("running_behind")
	elif leftright or updown:
		animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()
