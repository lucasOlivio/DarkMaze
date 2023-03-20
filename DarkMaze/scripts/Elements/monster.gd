extends Body
class_name Monster


var tilefloor : Node2D = null
var target : Node2D = null
var _target_initial_position : Vector2 = Vector2.ZERO
var _active : bool = false
var _path : PoolVector2Array = []


func _ready():
	target = owner.get_node("Player") # Set the target to the Player node
	tilefloor = owner.get_node("TileFloor")
	_update_path()

func _follow_player():
	if not _path:
		return

	var next_tile = tilefloor.map_to_world(_path[0])
	var next_direction = position.direction_to(next_tile)
	set_direction(next_direction)
	_path.remove(0)

func _update_path():
	if target.position == _target_initial_position or target.is_moving():
		return

	_target_initial_position = target.position
	_path = tilefloor.get_path_to_end(position, _target_initial_position)

func _on_CollisionPlayer_body_entered(body):
	if body.name == "Player":
		body.die()
	pass

func _physics_process(_delta):
	if not target or not _active or _is_moving:
		return

	_update_path()
	_follow_player()

func activate():
	_active = true

func deactivate():
	_active = false
	_target_initial_position = Vector2.ZERO
