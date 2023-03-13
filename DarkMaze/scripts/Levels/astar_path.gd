extends TileMap
class_name AStarPath

# Locked directions
const DIR_4 = [Vector2.LEFT,Vector2.UP,Vector2.RIGHT,Vector2.DOWN]
const HALF_TILE_SIZE = Vector2(16, 16)

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

func get_path_to_end(start:Vector2, end:Vector2) -> PoolVector2Array:
	var path_start = world_to_map(start)
	var path_end = world_to_map(end)

	return astar.get_point_path(id(path_start), id(path_end))

func map_to_world(map_position: Vector2, ignore_half_ofs: bool = false):
	var world_coordinates = .map_to_world(map_position, ignore_half_ofs)
	return world_coordinates + HALF_TILE_SIZE
