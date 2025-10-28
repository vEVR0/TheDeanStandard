extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var dean: CharacterBody2D = $"."

const SPEED = 100.0


func flip_cane():
	animated_sprite_2d.scale.x = -1

func unflip_cane():
	animated_sprite_2d.scale.x = 1

func _physics_process(delta: float) -> void:
	var mouse_position_var = get_local_mouse_position()
	
	if mouse_position_var.x < 0:
		flip_cane()
	elif mouse_position_var.x == 0:
		flip_cane()
	else:
		unflip_cane()

	var leftright := Input.get_axis("left", "right")
	
	print(leftright)
	if leftright:
		velocity.x = leftright * SPEED
		#if leftright > 0:
			#unflip_cane()
		#else:
			#flip_cane()
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
