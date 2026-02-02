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

	
	
