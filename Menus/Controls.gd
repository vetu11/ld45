extends CanvasLayer

signal change_menu

#func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

var fromPauseMenu = false
func _on_Back_pressed():
	
	emit_signal("change_menu", "res://Menus/MainMenu.tscn")

