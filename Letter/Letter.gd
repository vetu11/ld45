extends Area2D

export(int) var letter_position := 0

func _ready():
	$Label.text = self.name[0]
