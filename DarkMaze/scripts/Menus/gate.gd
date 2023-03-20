extends StaticBody2D


func _on_AreaExitedMaze_body_entered(body):
	if body.name == "Player":
		body.player_state = body.states.WIN
		get_parent().get_node("Win").visible = true
		get_tree().paused = true
