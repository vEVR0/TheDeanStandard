extends Node2D


const bush = preload("res://scenes/bush.tscn")

var max_bushes = 1000


func _ready() -> void:
	# spawns bushes in random positions
	# really need to change this, bushes can just spawn anywhere
	for i in range(max_bushes):
		var instantiate_bush = bush.instantiate()
		instantiate_bush.position.x = randi_range(-1000,1000)
		instantiate_bush.position.y = randi_range(-1000,1000)
		add_sibling.call_deferred(instantiate_bush)
