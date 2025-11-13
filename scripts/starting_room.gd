extends Node2D

@onready var left_door: Area2D = $LeftDoor
@onready var right_door: Area2D = $RightDoor
@onready var top_door: Area2D = $TopDoor
@onready var bottom_door: Area2D = $BottomDoor


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_door.visible = false
	right_door.visible = false
	top_door.visible = false
	bottom_door.visible = false
	
	var visible_door = randi_range(1,4)
	match visible_door:
		1:
			left_door.visible = true
		2:
			right_door.visible = true
		3:
			top_door.visible = true
		4:
			bottom_door.visible = true






func _on_left_door_body_entered(body: Node2D) -> void:
	Globals.random_room()


func _on_right_door_body_entered(body: Node2D) -> void:
	Globals.random_room()


func _on_top_door_body_entered(body: Node2D) -> void:
	Globals.random_room()


func _on_bottom_door_body_entered(body: Node2D) -> void:
	Globals.random_room()
