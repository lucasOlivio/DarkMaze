extends StaticBody2D


func _on_AreaExitedMaze_body_entered(body):
	if body.name == "Player":
		var level = get_parent()
		var controls = load("res://scenes/Menus/win.tscn").instance()
		get_tree().paused = true
		level.add_child(controls)
