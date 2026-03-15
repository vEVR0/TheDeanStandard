extends TextureProgressBar

var health_percent = 100


func _process(delta: float) -> void:
	value = Globals.health
