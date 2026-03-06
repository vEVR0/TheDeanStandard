extends weapon

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var cooldown_timer: Timer = $CooldownTimer


var damage = 50
var bugs_hit = []
var attack_scale = Vector2()


func _ready() -> void:
	# disables collion of cane
	collision_shape_2d.disabled = true
	
	# sets cane speed
	
	cooldown_timer.wait_time = 1 / Globals.attack_speed_modifier / 6
	animated_sprite_2d.set_speed_scale(2 * Globals.attack_speed_modifier)



func _process(delta: float) -> void:
	# cane looking at mouse cursor
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	# attacking
	if Input.is_action_just_pressed("attack"):
		if cooldown_timer.is_stopped():
			
			collision_shape_2d.disabled = false
			animated_sprite_2d.play("attack")
	attack_scale.x = Globals.attack_size_modifier
	attack_scale.y = Globals.attack_size_modifier
	set_scale(attack_scale)


func _on_animated_sprite_2d_animation_finished() -> void:
	# resets cane after attacking
	collision_shape_2d.disabled = true
	animated_sprite_2d.play("default")
	cooldown_timer.start()
	bugs_hit = []





func _on_body_entered(body: Node2D) -> void:
	for bug in bugs_hit:
		if bug == body:
			return
	Globals.emit_signal("attacking")
	weapon_damage(damage, body)
	bugs_hit.append(body)
