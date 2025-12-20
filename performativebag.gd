extends Item
@onready var sprite_2d: Sprite2D = $Sprite2D

var trick = 1
var totaltrick = 1
var item_count = 0
const max_damage = 5
const min_damage = 0.1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("attacking", Callable(self, "randomizedamage"))

func randomizedamage():
	Globals.damagemodifier /= totaltrick
	totaltrick = 1
	for i in item_count:
		var u = randf_range(0.0,1.0)
		trick = ((max_damage-1) - min_damage) * (u ** 12) + 1.1
		totaltrick *= trick
		print(totaltrick)
		print(trick)
	Globals.damagemodifier *= totaltrick
	print(Globals.damagemodifier)
	print("---")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	


func _on_body_entered(body: Node2D) -> void:
	
	print("kadhfakjdh")
	active(sprite_2d)
	item_count += 1
	
