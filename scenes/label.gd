extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("attacking", Callable(self, "enemy_hit"))
	
func enemy_hit():
	get_node("Label").text = "Hello Godot!"	
	
