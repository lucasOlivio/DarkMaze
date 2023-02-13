extends Body

class_name Player

func _init().(100):
	pass

func read_input(input):
	velocity = Vector2()

	if input.is_action_pressed("up"):
		velocity.y -= 1
		direction = Vector2(1, 0)
	elif input.is_action_pressed("down"):
		velocity.y += 1
		direction = Vector2(-1, 0)
	elif input.is_action_pressed("left"):
		velocity.x -= 1
		direction = Vector2(0, -1)
	elif input.is_action_pressed("right"):
		velocity.x += 1
		direction = Vector2(0, 1)

	set_rotation(direction.angle())

	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * speed)

func _physics_process(_delta):
	read_input(Input)
