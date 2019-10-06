extends CanvasLayer

# Resume game
func _on_Button1_pressed():
	pass

# Mute music
func _on_Button2_pressed():
	AudioPlayer.mute_unmute()

### Botón para mutear todos los sonidos? ###

# Finish game
func _on_Button3_pressed():
	SceneSwitcher.switch("res://Menus/MenuSelector.tscn")

# Exit program
func _on_Button4_pressed():
	get_tree().quit()

func _ready():
	pass
