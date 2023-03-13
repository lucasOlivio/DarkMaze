extends KinematicBody2D

class_name Body

# Game settings
var TILE_SIZE = 32

# Movement
var _direction : Vector2
var _speed : int
var _target_tile : Vector2
var _is_moving : bool

func _init(speed_: int = 0):
	_direction = Vector2()
	_speed = speed_
	_is_moving = false

func _move_to_tile():
	# Moves the Body to a new tile based on the velocity.
	# Only moves a tile a time to get the same movement as a bomberman game.
	if global_position.distance_to(_target_tile) < 1:
		global_position = _target_tile # Set to target to avoid milimetric errors in positioning
		_is_moving = false
		_direction = Vector2.ZERO
	else:
		_is_moving = true
		move_and_slide(_direction * _speed)

func _move():
	if _direction:
		look_at(_target_tile)
		_move_to_tile()
		$AnimatedSprite.play("Walking")
	else:
		$AnimatedSprite.play("Iddle")

func _physics_process(delta):
	_move()

func test_wall(move_vector: Vector2) -> bool:
	# Check if the movement will hit a wall
	var target = global_position + move_vector
	var raycast_check = get_world_2d().direct_space_state\
		.intersect_ray(global_position, target, [self], collision_mask)
	return raycast_check and raycast_check.collider.name == "TileWall"

func set_direction(direction_):
	if _is_moving or test_wall(direction_ * TILE_SIZE):
		return
	_direction = direction_
	_target_tile = (direction_ * TILE_SIZE) + global_position
