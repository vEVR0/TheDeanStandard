extends Area2D

var weapon_path
var weapon_node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



# broken pickup system, not working yet
func _on_area_entered(area: Area2D) -> void:
	# print("area entered")
	# if area is Weapon:
		#weapon_path = area.get_path()
		#set_weapon()
		#area.activate()
	pass


# broken pickup system, not working yet
func set_weapon():
	#print(weapon_path)
	#weapon_node = get_node(weapon_path)
	#var weapon_instance = weapon_node.instantiate()
	#add_sibling(weapon_instance)
	pass
