extends AnimatedSprite2D


func _ready() -> void:
	# sets the health bar to full
	set_frame(29)


func _process(delta: float) -> void:
	# sets the frame of the health bar
	set_frame((Globals.health/(Globals.maxhealth/30))-1)
