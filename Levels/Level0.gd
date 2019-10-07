extends Node2D

func _process(delta):
	
	if Input.is_action_pressed("ground_jump"):
		SceneSwitcher.switch("res://Levels/Level1.tscn")
