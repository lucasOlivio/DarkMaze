extends Body

class_name Pharao

var speed_ = 90

var tilefloor : Node2D = null
var target : Node2D = null
var target_initial_position : Vector2 = Vector2.ZERO
var active : bool = true
var _path : PoolVector2Array = []

func _init().(speed_):
	pass

func _ready():
	target = get_parent().get_node("Player") # Set the target to the Player node
	tilefloor = get_parent().get_node("TileFloor")
	_update_path()

func _follow_player():
	if not _path:
		return

	var next_tile = tilefloor.map_to_world(_path[0])
	var next_direction = position.direction_to(next_tile)
	set_direction(next_direction)
	_path.remove(0)

func _update_path():
	if target.position == target_initial_position or target.is_moving():
		return

	target_initial_position = target.position
	_path = tilefloor.get_path_to_end(position, target_initial_position)

func _physics_process(_delta):
	if not target or not active or _is_moving:
		return

	_update_path()
	_follow_player()
