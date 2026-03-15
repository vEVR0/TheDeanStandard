extends Node

const DUNGEONGENERATOR = preload("uid://coqd0pulakx3y")


var camera_position = Vector2i(0,0)


var maxhealth = 100
var health = maxhealth
var invun_time = 0.5

var damage_modifier = 1.0
var speed_modifier = 1.0
var attack_speed_modifier = 1.0
var attack_size_modifier = 1.0




# there was an annoying warning so this ignores it
@warning_ignore("unused_signal")
signal attacking

@warning_ignore("unused_signal")
signal entered_door

@warning_ignore("unused_signal")
signal exited_door

func lose_health(damage):
	print(damage)
	health = health - damage
