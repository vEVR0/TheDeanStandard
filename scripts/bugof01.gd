extends CharacterBody2D

@onready var dean: CharacterBody2D = $"../Dean"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D




var SPEED = 110

# Called when the node enters the scene tree for the first time.dddddd
func _ready() -> void:
	collision_shape_2d.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if global_position.distance_to(dean.global_position) > 1:
		position += transform.x * SPEED * delta
	look_at(dean.global_position)
	

	
	
	
	move_and_slide()
	
	
