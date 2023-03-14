extends KinematicBody2D

class_name Body

# Game settings
var TILE_SIZE = 32
var level : Node

# Movement
export var speed : int =  75
var _direction : Vector2
var _target_tile : Vector2
var _is_moving : bool
var _walking_sound : Node2D = null
var _walking_animation : Node2D = null
var _on_timer : bool = false

func _init():
	_direction = Vector2()
	_is_moving = false

func _ready():
	_walking_sound = get_node("AudioStreamPlayer2D")
	_walking_animation = get_node("AnimatedSprite")
	level = get_parent()

func _move_to_tile():
	# Moves the Body to a new tile based on the velocity.
	# Only moves a tile a time to get the same movement as a bomberman game.
	if global_position.distance_to(_target_tile) < 1:
		global_position = _target_tile # Set to target to avoid milimetric errors in positioning
		_is_moving = false
		_direction = Vector2.ZERO
	else:
		_is_moving = true
		move_and_slide(_direction * speed)

func _move():
	if _on_timer:
		# In case is needed to wait before walking or running the iddle animations
		return

	if _direction:
		look_at(_target_tile)
		_move_to_tile()
		if _walking_animation:
			_walking_animation.play("Walking")
		if _walking_sound and !_walking_sound.playing: 
			_walking_sound.play()
	else:
		if _walking_animation:
			_walking_animation.play("Iddle")
		if _walking_sound: 
			_walking_sound.stop()

func _physics_process(delta):
	_move()

func is_moving() -> bool:
	return _is_moving

func test_wall(move_vector: Vector2) -> bool:
	# Check if the movement will hit a wall
	var target = global_position + move_vector
	var space_state = get_world_2d().direct_space_state
	var raycast_check = space_state.intersect_ray(global_position, target, [self], collision_mask)
	return raycast_check and (raycast_check.collider.name == "TileWall" or raycast_check.collider.name == "Gate")

func set_direction(direction_):
	if _is_moving or test_wall(direction_ * TILE_SIZE):
		return
	_direction = direction_
	_target_tile = (direction_ * TILE_SIZE) + global_position
