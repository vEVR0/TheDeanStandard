extends Sprite2D


@onready var dean: CharacterBody2D = $"../Dean"


func _process(delta: float) -> void:
	# moving the bush infront or behind dean
	# as this is only for dean, will probably make this specific for each enemy and dean
	if dean.global_position.y >= global_position.y:
		z_index = 0
	else:
		z_index = 2
