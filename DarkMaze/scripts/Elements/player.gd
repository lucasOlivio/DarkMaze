extends Body

class_name Player

# Movement
var speed_ : int = 100

# Player state
var _dead = false

func _init().(speed_):
	pass

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
	# remove the CollisionShape2D node from the scene tree
	collision_shape.queue_free()
	_dead = true
	get_tree().reload_current_scene()

func is_dead():
	return _dead

func _physics_process(_delta):
	if is_dead(): return
	read_input(Input)
