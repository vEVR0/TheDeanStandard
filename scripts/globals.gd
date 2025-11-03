extends Node


var maxhealth = 100
var health = maxhealth
var invuntime = 0.5
var cooldownparticles: bool = false


func lose_health(damage):
	health -= damage
