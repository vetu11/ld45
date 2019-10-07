extends CanvasLayer

# Resume game
func _on_resume_pressed():
	get_tree().paused = false
	self.queue_free()

# Mute music
func _on_mute_pressed():
	AudioPlayer.mute_unmute()

### Botón para mutear todos los sonidos? ###

# Finish game
func _on_main_pressed():
	get_tree().paused = false
	SceneSwitcher.switch("res://Menus/MenuSelector.tscn")

# Exit program
func _on_exit_pressed():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = false
		self.queue_free()
