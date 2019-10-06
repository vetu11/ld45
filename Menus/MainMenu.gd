extends VBoxContainer

signal change_menu


func _on_DebugButton_pressed():
	emit_signal("change_menu", "res://Menus/DebugLevelSelectionMenu.tscn")

func _on_PlayButton_pressed():
	SceneSwitcher.switch("res://FirstScene.tscn")

func _on_MuteMusicButton_pressed():
	AudioPlayer.mute_unmute()

func _on_ExitButton_pressed():
	get_tree().quit()
