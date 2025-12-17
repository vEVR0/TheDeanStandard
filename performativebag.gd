extends Item
@onready var sprite_2d: Sprite2D = $Sprite2D

var trick = 1
var item_count = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func effects(added):
	for i in item_count:
		Globals.damagemodifier *= added

func _on_body_entered(body: Node2D) -> void:
	print("kadhfakjdh")
	active(sprite_2d)
	item_count += 1
	var u = randf_range(0.0,1.0)
	trick = (5 - 0.1) * (u ** 12) + 0.1
	effects(trick)
