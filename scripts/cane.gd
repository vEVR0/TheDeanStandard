extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var cooldown_timer: Timer = $CooldownTimer

var caneooldown = 0.5
var damage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooldown_timer.wait_time = caneooldown / 3
	animated_sprite_2d.set_speed_scale(1 / caneooldown)
	var x = 1.0/2.0
	x = str(x)
	print(x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(cooldown_timer.is_stopped())
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if Input.is_action_just_pressed("attack"):
		if cooldown_timer.is_stopped():
			collision_shape_2d.disabled = false
			animated_sprite_2d.play("attack")
	





func _on_animated_sprite_2d_animation_finished() -> void:
	collision_shape_2d.disabled = true
	animated_sprite_2d.play("default")
	cooldown_timer.start()




func _on_cooldown_timer_timeout() -> void:
	Globals.cooldownparticles = true
