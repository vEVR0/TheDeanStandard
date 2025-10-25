extends Node2D


const bush = preload("res://scenes/bush.tscn")
var max_bushes = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(max_bushes):
		var instantiate_bush = bush.instantiate()
		instantiate_bush.position.x = randi_range(-1000,1000)
		instantiate_bush.position.y = randi_range(-1000,1000)
		add_sibling.call_deferred(instantiate_bush)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
