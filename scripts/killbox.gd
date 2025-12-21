extends Area2D

@onready var timer: Timer = $Timer
@onready var dean: CharacterBody2D = $"../../Dean"

# Probably need to clean up this whole script and node, it should really all be in the bugof01.gd



var InDean = false
var damage = 20

func _ready() -> void:
	timer.wait_time = Globals.invuntime


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == dean:
		Globals.lose_health(damage)
		timer.start()
	

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	timer.stop()


func _on_timer_timeout() -> void:
	Globals.lose_health(damage)
