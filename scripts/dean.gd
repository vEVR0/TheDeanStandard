extends CharacterBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var cooldown_particles: GPUParticles2D = $CooldownParticles
@onready var cooldown_particle_timer: Timer = $CooldownParticleTimer

const BASESPEED = 100.0
var SPEED = BASESPEED
var distance = 0
var previousx = 0
var previousy = 0



func _physics_process(delta: float) -> void:
	if Globals.health < 1:
		queue_free()
	

	# plays cooldown particles and starts the cooldown timer.
	if Globals.cooldownparticles:
		cooldown_particles.emitting = true
		cooldown_particle_timer.start()
		Globals.cooldownparticles = false
	
	
	# flipping dean's sprite
	if get_local_mouse_position().x < 0 or get_local_mouse_position().x == 0:
		animated_sprite_2d.scale.x = -1
	else:
		animated_sprite_2d.scale.x = 1
	
	
	# movement left and right
	var leftright := Input.get_axis("left", "right")
	
	if leftright:
		velocity.x = leftright * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	# movement up and down
	var updown := Input.get_axis("up", "down")
	
	if updown:
		velocity.y = updown * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Diagonal
	if leftright != 0 and updown != 0:
		SPEED = (BASESPEED * Globals.speedmodifier / (2**0.5) )
	else:
		SPEED = BASESPEED * Globals.speedmodifier
	
	# animation
	if updown == -1.0:
		animated_sprite_2d.play("running_behind")
	elif leftright or updown:
		animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("idle")
	
	move_and_slide()



func _on_cooldown_particle_timer_timeout() -> void:
	# stops particles after the timer ends
	cooldown_particles.emitting = false
	

	
