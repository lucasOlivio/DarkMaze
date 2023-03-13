extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	SceneTransition.change_scene("res://scenes/Levels/level_easy.tscn")

func _on_ControlsButton_pressed():
	var controls = load("res://scenes/Menus/controls.tscn").instance()
	get_tree().current_scene.add_child(controls)

func _on_QuitButton_pressed():
	get_tree().quit()

func _process(delta):
	if $BackgroundMusic.playing == false:
		$BackgroundMusic.play()
	pass
