extends Monster

class_name Mummy

# Player line of sight detection
var _player_in_range : bool = false
var _sight_on_player : bool = false

func _sight_check(): 
	# Checks line of sight with intersecting ray
	var global_pos = get_global_position()
	var global_target = target.get_global_position()
	
	var space_state = get_world_2d().direct_space_state
	var raycast_check = space_state.intersect_ray(global_pos, global_target, [self], collision_mask)
	
	# Mummy sees player and player not dead
	if raycast_check and raycast_check.collider == target and _player_in_range:
		activate()
	else:
		deactivate()
	return

func _on_Area2D_body_entered(body: Node) -> void: # Checks when a body enters sight
	if body.name == "Player":
		_player_in_range = true
	pass

func _on_Area2D_body_exited(body: Node) -> void: # Checks when a body leaves sight
	if body.name == "Player":
		_player_in_range = false
	pass

func _physics_process(_delta):
	if not target:
		return
	
	_sight_check()
