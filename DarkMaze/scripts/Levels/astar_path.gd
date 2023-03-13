extends TileMap
class_name AStarPath

# Locked directions
const DIR_4 = [Vector2.LEFT,Vector2.UP,Vector2.RIGHT,Vector2.DOWN]

onready var astar = AStar2D.new()
onready var used_cells = get_used_cells()

# Cantor pairing function
func id(point:Vector2) -> float:
	var a = point.x
	var b = point.y
	return (a + b) * (a + b + 1) / 2 + b

func _ready():
	_add_points()
	_connect_points()

func _add_points() -> void:
	for cell in used_cells:
		astar.add_point(id(cell), cell, 1)

func _connect_points() -> void:
	for cell in used_cells:
		for neighbor in DIR_4:
			var next_cell = cell + neighbor
			if used_cells.has(next_cell):
				astar.connect_points(id(cell), id(next_cell), false)

func get_path_(start:Vector2, end:Vector2) -> PoolVector2Array:
	var map_start = world_to_map(start)
	var map_end = world_to_map(end)
	return astar.get_point_path(id(map_start), id(map_end))
