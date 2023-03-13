extends Control


func _on_BackButton_pressed():
	get_parent().remove_child(self)
