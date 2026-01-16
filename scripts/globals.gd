extends Node


var maxhealth = 100
var health = maxhealth
var invuntime = 0.5
var cooldownparticles : bool = false
var damagemodifier = 1.0
var speedmodifier = 1.0
var room_count : int = 0
var boss_chance 
var room_limit = 7
var reached_boss : bool = false
var already_room : bool = false

var rooms = [
	{"scene": preload("res://scenes/exampleroom1.tscn"), "weight": 50, "name": "1",},
	{"scene": preload("res://scenes/exampleroom2.tscn"), "weight": 50, "name": "2",},
]

signal attacking

func lose_health(damage):
	print(damage)
	health = health - damage
	



func random_room():
	room_count += 1
	print(room_count)
	if boss_room():
		reached_boss = true
		return "B"
	else:
		var chosen_room = choose_random_room()
		return chosen_room




func choose_random_room():
		var total_weight = 0
		
		
		for room in rooms:
			total_weight += room.weight
		
		var rand_val = randf_range(0.0, total_weight)
		var running_total = 0.0
		
		for room in rooms:
			running_total += room.weight
			if rand_val <= running_total:
				return room.name


func load_room(loaded_name):
	return loaded_name

func boss_room():
	var rooms_left = room_limit - room_count
	if rooms_left <= 0:
		return true
	if boss_roll(4 * rooms_left - 2):
		return true
	else:
		return false



func boss_roll(upper_limit):
	var boss = randi_range(1,upper_limit)
	match boss:
		1:
			return true
		_:
			return false
