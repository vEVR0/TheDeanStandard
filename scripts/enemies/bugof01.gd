extends CharacterBody2D


@onready var dean: CharacterBody2D = $"../Dean"

var SPEED = 50
var health = 200


func _process(delta: float) -> void:
	# basic moving toward dean
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if global_position.distance_to(dean.global_position) > 1:
		position += transform.x * SPEED * delta
	look_at(dean.global_position)
	
	
	# death
	if health < 1:
		queue_free()
	
	move_and_slide()



func lose_health(damage):
	health -= damage
