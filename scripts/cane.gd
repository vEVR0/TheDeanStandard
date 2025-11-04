extends Area2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var cooldown_timer: Timer = $CooldownTimer

var caneooldown = 0.5
var damage = 50
var bugs_hit = []


func _ready() -> void:
	# disables collion of cane
	collision_shape_2d.disabled = true
	
	# sets cane speed
	cooldown_timer.wait_time = caneooldown / 3
	animated_sprite_2d.set_speed_scale(1 / caneooldown)



func _process(delta: float) -> void:
	# cane looking at mouse cursor
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	# attacking
	if Input.is_action_just_pressed("attack"):
		if cooldown_timer.is_stopped():
			collision_shape_2d.disabled = false
			animated_sprite_2d.play("attack")



func _on_animated_sprite_2d_animation_finished() -> void:
	# resets cane after attacking
	collision_shape_2d.disabled = true
	animated_sprite_2d.play("default")
	cooldown_timer.start()
	bugs_hit = []



func _on_cooldown_timer_timeout() -> void:
	Globals.cooldownparticles = true


func _on_body_entered(body: Node2D) -> void:
	for bug in bugs_hit:
		if bug == body:
			return
	body.lose_health(damage * Globals.damagemodifier)
	bugs_hit.append(body)
