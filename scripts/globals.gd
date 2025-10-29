extends Node

func lose_health(damage):
	Globals.health -= damage
	
var maxhealth = 100
var health = maxhealth
var invuntime = 0.5

var cooldownparticles: bool = false
