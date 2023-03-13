extends Body

class_name Pharao

var speed_ = 90

var tilefloor : Node2D = null
var target : Node2D = null
var active : bool = true
var path : PoolVector2Array = []

func _ready():
	target = get_parent().get_node("Player") # Set the target to the Player node
	tilefloor = get_parent().get_node("TileFloor")
	path = tilefloor.get_path_(position, target.position)
	
func _physics_process(delta):
	if not target or not active or _is_moving or not path:
		return

	print("PATH ", path[0])
	var next_tile = tilefloor.map_to_world(path[0])
	print("NEXT TILE ", next_tile)
	var next_direction = position.direction_to(next_tile)
	set_direction(next_direction)
	path.remove(0)
