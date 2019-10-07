extends CanvasLayer

onready var container = $Control
onready var current_menu = container.get_child(0)
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Resume game
func _on_resume_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
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

# Controls menu
func _on_controls_pressed():
	var new_menu = load("res://Menus/Controls.tscn").instance()
	new_menu.fromPauseMenu = true	
	new_menu.get_node("Control/Background").visible = false
	current_menu.queue_free()
	container.add_child(new_menu)
	container.move_child(new_menu, 0)

# Exit program
func _on_exit_pressed():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = false
		self.queue_free()
