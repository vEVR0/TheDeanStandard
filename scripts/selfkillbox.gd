extends Area2D
var health = 3
@onready var bigboss: CharacterBody2D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health < 1:
		bigboss.queue_free()
		print("die")

func _on_area_entered(area: Area2D) -> void:
	health -= 1
	print(health)
	
	# referencing same code thing shimaing
