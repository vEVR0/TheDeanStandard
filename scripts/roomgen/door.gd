extends StaticBody2D

@onready var dean: CharacterBody2D = $"../../Dean"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == dean:
		Globals.emit_signal("entered_door")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == dean:
		Globals.emit_signal("exited_door")
