extends Node2D

@onready var main: Node = $".."

const bugof01 = preload("res://scenes/bugof01.tscn")
var instantiate_bug = bugof01.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	instantiate_bug.position = Vector2(randf_range(1, 50), randf_range(1, 50))
	main.add_child(instantiate_bug)
	print("bug")
