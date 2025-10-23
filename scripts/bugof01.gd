extends CharacterBody2D

@onready var dean: CharacterBody2D = %Dean

var SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if global_position.distance_to(dean.global_position) > 1:
		position += transform.x * SPEED * delta
	look_at(dean.global_position)
	
	#global_position.x = global_position.x + (sin(rotation_degrees))
	#global_position.y = global_position.y + (cos(rotation_degrees))
	
	
	
	move_and_slide()
	
	
