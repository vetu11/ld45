extends CanvasLayer

signal resume

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Resume game
func _on_resume_pressed():
#	$"Click".play()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().paused = false
	self.queue_free()
	emit_signal("resume")

func _on_mute_pressed():
#	$"Click".play()
	AudioPlayer.mute_unmute()

func _on_main_pressed():
#	$"Click".play()
	get_tree().paused = false
	SceneSwitcher.switch("res://Menus/MenuSelector.tscn")

func _on_exit_pressed():
#	$"Click".play()
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = false
		self.queue_free()
