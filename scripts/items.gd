class_name Item extends Area2D

var item_active = false

func active(sprite : Sprite2D):
	sprite.hide()
	item_active = true
