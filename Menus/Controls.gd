extends CanvasLayer

signal change_menu
signal play_sound

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Back_pressed():
	emit_signal("play_sound")
	emit_signal("change_menu", "res://Menus/MainMenu.tscn")
