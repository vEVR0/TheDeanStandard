extends Item
@onready var sprite_2d: Sprite2D = $Sprite2D

var trick = 1
var item_count = 0
const max_damage = 5
const min_damage = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("attacking", Callable(self, "randomizedamage"))

func randomizedamage():
	if item_active:
		Globals.damage_modifier -= trick
		var u = randf_range(0.0,1.0)
		trick = ((max_damage-1) - min_damage) * (u ** 12) + 1.1
		Globals.damage_modifier += trick
		


func _on_body_entered(body: Node2D) -> void:
	active(sprite_2d)
