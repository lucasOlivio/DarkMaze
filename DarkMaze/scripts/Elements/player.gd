extends Body

class_name Player

# Player state
var _dead = false
var _chest = false setget active_chest, is_active_chest

func active_chest(is_active = false):
	_chest = is_active

func is_active_chest():
	return _chest

func read_input(Input) -> void:
	if Input.is_action_pressed("up"):
		set_direction(Vector2.UP)
	elif Input.is_action_pressed("down"):
		set_direction(Vector2.DOWN)
	elif Input.is_action_pressed("left"):
		set_direction(Vector2.LEFT)
	elif Input.is_action_pressed("right"):
		set_direction(Vector2.RIGHT)

func die():
	var collision_shape = $CollisionShape2D
	var controls = load("res://scenes/Menus/game_over.tscn").instance()
	# remove the CollisionShape2D node from the scene tree
	collision_shape.queue_free()
	_dead = true
	get_parent().add_child(controls)

func is_dead():
	return _dead

func _physics_process(_delta):
	if is_dead() or is_active_chest(): return
	read_input(Input)
