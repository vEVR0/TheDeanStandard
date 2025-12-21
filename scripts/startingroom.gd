extends Node2D

@onready var left_door: Area2D = $LeftDoor
@onready var right_door: Area2D = $RightDoor
@onready var top_door: Area2D = $TopDoor
@onready var bottom_door: Area2D = $BottomDoor

@onready var collision_shape_left: CollisionShape2D = $LeftDoor/CollisionShape2D
@onready var collision_shape_right: CollisionShape2D = $RightDoor/CollisionShape2D
@onready var collision_shape_top: CollisionShape2D = $TopDoor/CollisionShape2D
@onready var collision_shape_bottom: CollisionShape2D = $BottomDoor/CollisionShape2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	left_door.visible = false
	right_door.visible = false
	top_door.visible = false
	bottom_door.visible = false
	
	collision_shape_left.disabled = true
	collision_shape_right.disabled = true
	collision_shape_top.disabled = true
	collision_shape_bottom.disabled = true
	
	var visible_door = randi_range(1,4)
	match visible_door:
		1:
			left_door.visible = true
			collision_shape_left.disabled = false
		2:
			right_door.visible = true
			collision_shape_right.disabled = false
		3:
			top_door.visible = true
			collision_shape_top.disabled = false
		4:
			bottom_door.visible = true
			collision_shape_bottom.disabled = false





func _on_left_door_body_entered(body: Node2D) -> void:
	Globals.random_room()


func _on_right_door_body_entered(body: Node2D) -> void:
	Globals.random_room()


func _on_top_door_body_entered(body: Node2D) -> void:
	Globals.random_room()


func _on_bottom_door_body_entered(body: Node2D) -> void:
	Globals.random_room()
