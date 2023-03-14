extends Sprite

var pharao : Node
var player : Node
var gate : StaticBody2D

func _ready():
	pharao = get_parent().get_node("Pharao")
	gate = get_parent().get_node("Gate")

func _on_PickupArea_body_entered(body):
	if body.name == "Player":
		player = body
		player.active_chest(true)
		$AudioStreamPlayer2D.play()


func _on_AudioStreamPlayer2D_finished():
	pharao.activate()
	player.active_chest(false)
	can_exit_maze()
	get_parent().remove_child(self)


func can_exit_maze():
	# Open the gate from the initial position
	gate.get_node("SpriteClosed").visible = false
	gate.get_node("SpriteOpen").visible = false
	gate.get_node("CollisionShape2D").disabled = true
