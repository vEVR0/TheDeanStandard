extends Node


var maxhealth = 100
var health = maxhealth
var invuntime = 0.5
var cooldownparticles: bool = false
var damagemodifier = 1.0

func lose_health(damage):
	health -= damage
