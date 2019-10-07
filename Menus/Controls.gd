extends CanvasLayer

signal change_menu

onready var container = $Control
onready var current_menu = container.get_child(0)
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

var fromPauseMenu = false
func _on_Back_pressed():
	if !fromPauseMenu:
		emit_signal("change_menu", "res://Menus/MainMenu.tscn")
	else:
		var new_menu = load("res://Menus/PauseMenu.tscn").instance()
		current_menu.queue_free()
		container.add_child(new_menu)
		container.move_child(new_menu, 0)
