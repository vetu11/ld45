extends VBoxContainer

signal change_menu
signal play_sound

func _on_DebugButton_pressed():
	emit_signal("play_sound")
	emit_signal("change_menu", "res://Menus/DebugLevelSelectionMenu.tscn")

func _on_PlayButton_pressed():
	emit_signal("play_sound")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	SceneSwitcher.switch("res://FirstScene.tscn")

func _on_MuteMusicButton_pressed():
	emit_signal("play_sound")
	AudioPlayer.mute_unmute()

func _on_ExitButton_pressed():
	emit_signal("play_sound")
	get_tree().quit()

func _on_ControlsMenu_pressed():
	emit_signal("play_sound")
	emit_signal("change_menu", "res://Menus/Controls.tscn")
