extends VBoxContainer

signal change_menu


func _on_SpaceLevelButton_pressed():
	SceneSwitcher.switch("res://FirstScene.tscn")


func _on_GroundLevelButton_pressed():
	SceneSwitcher.switch("res://GroundScene.tscn")


func _on_MainMenuButton_pressed():
	emit_signal("change_menu", "res://Menus/MainMenu.tscn")
