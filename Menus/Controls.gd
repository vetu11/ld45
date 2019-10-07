extends CanvasLayer

signal change_menu

func _on_Back_pressed():
	emit_signal("change_menu", "res://Menus/MainMenu.tscn")
