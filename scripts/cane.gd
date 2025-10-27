extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape_2d.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if Input.is_action_just_pressed("attack"):
		collision_shape_2d.disabled = false
		animated_sprite_2d.play("attack")
		print("attack")
	





func _on_animated_sprite_2d_animation_finished() -> void:
	print("finished")
	collision_shape_2d.disabled = true
	animated_sprite_2d.play("default")


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	print("monkey")
