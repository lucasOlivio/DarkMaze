extends Body

class_name Mummy

# Locked directions for NPC
const DIR_4 = [Vector2.LEFT,Vector2.UP,Vector2.RIGHT,Vector2.DOWN]

# Movement
var speed_ = 50

# Player line of sight detection
var player_in_range : bool = false
var sight_on_player : bool = false
var last_seen_pos : Vector2
var player_direction : Vector2
var target : Node
var intersect_pos = Vector2.ZERO

func _init().(speed_):
	pass

func _sight_check(): # Checks line of sight with intersecting ray
	var global_pos = get_global_position()
	var global_target = target.get_global_position()
	
	var space_state = get_world_2d().direct_space_state
	var raycast_check = space_state.intersect_ray(global_pos, global_target, [self], collision_mask)
	
	if raycast_check and raycast_check.collider == target: # Mummy sees player and player not dead
		intersect_pos = raycast_check.position
		sight_on_player = true
	else:
		sight_on_player = false
	return

func check_player() -> void:
	# Checks if player in range and on sight set movement towards player
	if player_in_range:
		_sight_check()

	if target and target.is_dead():
		player_direction = Vector2.ZERO
	elif player_in_range and sight_on_player:
		player_direction = position.direction_to(target.position)
	elif last_seen_pos:
		player_direction = position.direction_to(last_seen_pos)
	else:
		player_direction = Vector2.ZERO

	player_direction = get_locked_direction(player_direction)
	set_direction(player_direction)

func get_locked_direction(direction:Vector2) -> Vector2: 
	# Convert direction to one of the 4 possible directions the NPC can move
	var dirinput_snapped = Vector2()
	if direction != Vector2.ZERO:
		var direction_id = int(4.0 * (direction.rotated(PI / 4.0).angle() + PI) / TAU)
		dirinput_snapped = DIR_4[direction_id]
	return dirinput_snapped

func _on_Area2D_body_entered(body: Node) -> void: # Checks when a body enters sight
	if body.name == "Player":
		player_in_range = true
		target = body
	pass

func _on_Area2D_body_exited(body: Node) -> void: # Checks when a body leaves sight
	if body.name == "Player":
		player_in_range = false
		last_seen_pos = body.position
		target = null
	pass

func _on_CollisionPlayer_body_entered(body):
	if body.name == "Player":
		body.die()
	pass

func _physics_process(_delta):
	check_player()
