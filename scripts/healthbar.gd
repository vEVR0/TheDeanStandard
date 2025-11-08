extends TextureProgressBar

var health_percent = 100


func _process(delta: float) -> void:
	health_percent = (Globals.health / Globals.maxhealth) * 100
	value = health_percent
