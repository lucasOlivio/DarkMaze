extends CanvasLayer

export var menus_path : String = "res://scenes/Menus/"
export var level_path : String = "res://scenes/Levels/"
export var level_selected : String = "level_easy"

func _on_StartButton_pressed():
	SceneTransition.change_scene(level_path + level_selected + ".tscn")

func _on_ControlsButton_pressed():
	var controls = load(menus_path + "controls.tscn").instance()
	get_tree().current_scene.add_child(controls)

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_MenuButton_pressed():
	SceneTransition.change_scene(menus_path + "menu.tscn")

func _on_RestartButton_pressed():
	get_tree().reload_current_scene()

func _process(delta):
	if $BackgroundMusic and $BackgroundMusic.playing == false:
		$BackgroundMusic.play()
	pass
