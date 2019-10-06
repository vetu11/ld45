extends Control

onready var container = $MarginContainer/Container
onready var current_menu = container.get_child(0)

func _ready():
	current_menu.connect("change_menu", self, "_on_Menu_Change_signal")

func _on_Menu_Change_signal(menu):
	var new_menu = load(menu).instance()
	current_menu.queue_free()
	container.add_child(new_menu)
	container.move_child(new_menu, 0)
	new_menu.connect("change_menu", self, "_on_Menu_Change_signal")
	current_menu = new_menu
