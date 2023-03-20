extends Body

class_name Player

# Player state
enum states {LIVE, DEAD, COLLECTING_TREASURE, WIN}
var player_state : int

var game_over : Node = null

func _ready():
	player_state = states.LIVE
	game_over = get_parent().get_node("GameOver")

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
	player_state = states.DEAD
	game_over.visible = true
	# remove the CollisionShape2D node from the scene tree
	$CollisionShape2D.queue_free()

func _physics_process(_delta):
	if player_state != states.LIVE: return
	read_input(Input)
