extends Area2D

@onready var dean: CharacterBody2D = %Dean



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	look_at(dean.global_position)
	global_position.y = global_position.y + 1
