extends AnimatedSprite2D

@onready var label: Label = $"../../Label"
@onready var bugof_01: CharacterBody2D = $"../../../Bugof01"

var bugcounter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)


func _on_killbox_body_entered(body: Node2D) -> void:
	body.queue_free()
	bugcounter += 1
	label.text = str(bugcounter)
