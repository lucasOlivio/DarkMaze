extends Buttons


func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		var player = owner.get_node("Player")
		if player.player_state in [player.states.WIN, player.states.DEAD]: return
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
