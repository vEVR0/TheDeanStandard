extends Node


var maxhealth = 100
var health = maxhealth
var invuntime = 0.5
var cooldownparticles : bool = false
var damagemodifier = 1.0
var speedmodifier = 1.0
var room_count : int = 0
var boss_chance 

var already_room : bool = false

var rooms = [
	{"scene": preload("res://scenes/exampleroom1.tscn"), "weight": 50},
	{"scene": preload("res://scenes/exampleroom2.tscn"), "weight": 50},
]

signal attacking

func lose_health(damage):
	print("damage")
	health -= damage
	



func random_room():
	if already_room:
		return
	already_room = true
	room_count += 1
	print(room_count)
	if boss_room():
		print("BOSS")
	else:
		print("no boss")
		var chosen_room = choose_random_room()
		load_room(chosen_room)
	already_room = false



func choose_random_room():
		var total_weight = 0
		
		
		for room in rooms:
			total_weight += room.weight
		
		var rand_val = randf_range(0.0, total_weight)
		var running_total = 0.0
		
		for room in rooms:
			running_total += room.weight
			if rand_val <= running_total:
				return room.scene


func load_room(scene : PackedScene):
	get_tree().call_deferred("change_scene_to_packed", scene)

func boss_room():
	if room_count >= 7:
		return true
	else:
		match room_count:
			4:
				if boss_roll(10):
					return true
			5:
				if boss_roll(6):
					return true
			6:
				if boss_roll(3):
					return true
			_:
				return false



func boss_roll(upper_limit):
	var boss = randi_range(1,upper_limit)
	match boss:
		1:
			return true
		_:
			return false
