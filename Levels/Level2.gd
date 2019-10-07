extends Node2D


func _on_LetterCollector_all_letters_collected():
	SceneSwitcher.switch("res://Levels/Level3.tscn")
