extends CharacterBody2D

@onready var dean: CharacterBody2D = $"../Dean"

var SPEED = randi_range(80,90)
var HEALTH = 2


func _process(delta: float) -> void:
	# moving
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if global_position.distance_to(dean.global_position) > 1:
		position += transform.x * SPEED * delta
	look_at(dean.global_position)

	
	
	
