extends Camera2D


func _process(delta: float) -> void:
	global_position.x = Globals.camera_position.x
	global_position.y = Globals.camera_position.y
