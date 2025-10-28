extends AnimatedSprite2D

@onready var healthbar: AnimatedSprite2D = $"."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_frame(29)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_frame((Globals.health/(Globals.maxhealth/30))-1)
	print(sprite_frames)
