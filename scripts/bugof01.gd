extends CharacterBody2D


@onready var dean: CharacterBody2D = $"../Dean"

var SPEED = 0
var health = 100


func _process(delta: float) -> void:
	# moving
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if global_position.distance_to(dean.global_position) > 1:
		position += transform.x * SPEED * delta
	look_at(dean.global_position)
	
	if health < 1:
		queue_free()



func lose_health(damage):
	health -= damage
