extends Node


func Display_DamageNumber(value: int, x: int, y: int):
	var position = Vector2(x,y)
	var number = Label.new()
	number.global_position = position
	number.text = str(value)
	number.z_index = 5
	number.label_settings = LabelSettings.new()
	var colour = "#FFF"
	number.label_settings.font_color = colour
	number.label_settings.font_size = 15
	number.label_settings.outline_color = "#000"
	number.label_settings.outline_size = 2
	number.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR

	call_deferred("add_child", number)
	

	
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(
		number, "position:y", number.position.y -12, 0.125
	).set_ease(Tween.EASE_OUT)
	
	tween.tween_property(
		number, "position:y", number.position.y, 0.25
	).set_ease(Tween.EASE_IN).set_delay(0.125)
	
	tween.tween_property(
		number, "scale", Vector2.ZERO, 0.125
	).set_ease(Tween.EASE_IN).set_delay(0.25)
	
	await tween.finished
	number.queue_free()
