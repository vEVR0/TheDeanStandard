extends Area2D

@onready var timer: Timer = $Timer
@onready var dean: CharacterBody2D = $"../../Dean"

var InDean = false


func _ready() -> void:
	timer.wait_time = Globals.invuntime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.health < 1:
		dean.queue_free()

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body == dean:
		Globals.health += -5
		timer.start()
	

func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	timer.stop()


func _on_timer_timeout() -> void:
	Globals.health += -5
