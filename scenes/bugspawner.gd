extends Node2D


const bugof01 = preload("res://scenes/bugof01.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	var instantiate_bug = bugof01.instantiate()
	add_sibling(instantiate_bug)
