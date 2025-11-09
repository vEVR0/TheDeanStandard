extends Node2D


const bugof01 = preload("res://scenes/bugof01.tscn")

var num_of_bugs = 0
var max_bugs = 0


func _on_timer_timeout() -> void:
	# makes the bugs spawn on a timer, will probably change later
	if num_of_bugs < max_bugs:
		var instantiate_bug = bugof01.instantiate()
		# random position
		instantiate_bug.position.x = randi_range(-1000,1000)
		instantiate_bug.position.y = randi_range(-1000,1000)
		add_sibling(instantiate_bug)
		num_of_bugs += 1
