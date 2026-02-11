extends Node2D

@onready var dean: CharacterBody2D = $Dean
@onready var camera: Camera2D = $Camera2D


@export var _dimensions : Vector2i = Vector2i(10,10)
@export var _start : Vector2i = Vector2i(3,0)
@export var _critical_path_length : int = 10
var room_position = Vector2i(0,0)
var dungeon: Array
var _branch_candidates : Array[Vector2i]
var random_room = ""
@export var _branches : int = 3
@export var _branch_length : Vector2i = Vector2i(1,5)
@export var room_size = Vector2i(464, 256)

func _ready() -> void:
	_initialize_dungeon()
	_place_entrance()
	_generate_critical_path(_start, _critical_path_length, true)
	_generate_branches()
	_print_dungeon()

func _process(delta: float) -> void:
	var relative_pos_x = dean.position.x 
	var relative_pos_y = dean.position.y 
	camera.position.x = (floor(relative_pos_x  / room_size.x) * room_size.x) + room_size.x / 2
	camera.position.y = (floor(relative_pos_y  / room_size.y) * room_size.y) + room_size.y / 2

func _initialize_dungeon() -> void:
	for x in _dimensions.x:
		dungeon.append([])
		for y in _dimensions.y:
			dungeon[x].append(0)

func _place_entrance() -> void:
	if _start.x < 0 or _start.x >= _dimensions.x:
		_start.x = randi_range(0, _dimensions.x - 1)
	if _start.y < 0 or _start.y >= _dimensions.y:
		_start.y = randi_range(0, _dimensions.y - 1)

	
	
	
	dungeon[_start.x][_start.y] = {"id" : "res://scenes/rooms/startingroom.tscn", "direction" : "(0, 0)"}
	

func _generate_critical_path(from : Vector2i, length : int, critical : bool) -> bool:
	if Globals.reached_boss:
		return true
	var current_critical = critical
	if length == 0:
		return true
	if length == 1 and critical:
		#marker = "B"
		pass
	var current : Vector2i = from
	var direction : Vector2i
	match randi_range(0,3):
		0:
			direction = Vector2i.UP
		1:
			direction = Vector2i.RIGHT
		2:
			direction = Vector2i.DOWN
		3:
			direction = Vector2i.LEFT
	for i in 4:
		if (current.x + direction.x >= 0 and current.x + direction.x < _dimensions.x and 
			current.y + direction.y >= 0 and current.y + direction.y < _dimensions.y and 
			not dungeon[current.x + direction.x][current.y + direction.y]):
			
			current += direction
			
			var random_room = Globals.random_room()
			
			var marker : Dictionary = {"id": null, "direction": direction, "branch": "false"}
			if not critical:
				marker.branch = "true"
				print("true")
			marker.id = random_room
			dungeon[current.x][current.y] = marker
			if length > 2:
				_branch_candidates.append(current)
			if _generate_critical_path(current, length - 1, current_critical):
				return true
			else:
				_branch_candidates.erase(current)
				dungeon[current.x][current.y] = 0
				current -= direction
		direction = Vector2(direction.y, -direction.x)
	return false



func _generate_branches():
	var branches_created : int = 0
	var candidate : Vector2i
	while branches_created < _branches and _branch_candidates.size():
		candidate = _branch_candidates[randi_range(0, _branch_candidates.size() - 1)]
		if _generate_critical_path(candidate, randi_range(_branch_length.x, _branch_length.y),  false):
			branches_created += 1
		else:
			_branch_candidates.erase(candidate)


func _print_dungeon() -> void:
	#print(dungeon)
	var dungeon_as_string : String = ""
	for y in range(_dimensions.y -1, -1, -1):
		for x in _dimensions.x:
			if dungeon[x][y]:
				print(dungeon[x][y])
				var door_position = Vector2i(0, 0)
				var door_rotation = 0
				var door_scene = load("res://scenes/door.tscn")
				var door_instance = door_scene.instantiate()
				var door_vector = dungeon[x][y].direction
				door_vector = str(door_vector)
				match door_vector:
					"(0, 1)":
						door_position.x = room_position.x + room_size.x / 2
						door_position.y = room_position.y 
						door_rotation = 180
					"(1, 0)":
						door_position.x = room_position.x 
						door_position.y = room_position.y + room_size.y / 2
						door_rotation = 90
					"(0, -1)":
						door_position.x = room_position.x + room_size.x / 2
						door_position.y = room_position.y + room_size.y
						door_rotation = 0
					"(-1, 0)":
						door_position.x = room_position.x + room_size.x
						door_position.y = room_position.y + room_size.y / 2
						door_rotation = 270
					_:
						print("nothing")
				door_instance.position = door_position
				door_instance.rotation_degrees = door_rotation
				add_child(door_instance)

				var room_id = dungeon[x][y].id
				var loaded_room = load(room_id)
				var room_instance = loaded_room.instantiate()
				room_instance.position.x = room_position.x
				room_instance.position.y = room_position.y
				add_child(room_instance)
				dungeon_as_string += "[" + str(dungeon[x][y]) + "]"
			else:
				dungeon_as_string += "[ ]"
			room_position.x += room_size.x
		room_position.x = 0
		room_position.y -= room_size.y
		dungeon_as_string += '\n'
	#print(dungeon_as_string)
