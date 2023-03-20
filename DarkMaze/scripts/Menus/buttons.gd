extends CanvasLayer
class_name Buttons

export var menus_path : String = "res://scenes/Menus/"
export var level_path : String = "res://scenes/Levels/"
export var level_selected : String

var background_music : Node
var is_paused = false setget set_is_paused


func _ready():
	background_music = get_node("BackgroundMusic")

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused

func _on_ContinueButton_pressed():
	visible = false
	owner.get_node("LevelSelection").visible = true

func _on_StartButton_pressed():
	$VBoxContainer.visible = false
	get_node("HowToPlay").visible = true

func _on_EasyButton_pressed():
	level_selected = "level_easy"
	change_scene()

func _on_MediumButton_pressed():
	level_selected = "level_medium"
	change_scene()

func _on_HardButton_pressed():
	level_selected = "level_hard"
	change_scene()

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_MenuButton_pressed():
	SceneTransition.change_scene(menus_path + "menu.tscn")

func _on_ResumeButton_pressed():
	self.is_paused = false

func _on_RestartButton_pressed():
	self.is_paused = false
	get_tree().reload_current_scene()

func _on_BackButton_pressed():
	visible = false
	owner.get_node("VBoxContainer").visible = true

func _process(delta):
	if visible and background_music and background_music.playing == false:
		background_music.play()
	pass

func change_scene():
	SceneTransition.change_scene(level_path + level_selected + ".tscn")
