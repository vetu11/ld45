extends Node2D

signal all_letters_collected

export(int) var letters_in_this_level = 1

var collected_letters := 0
var display_initialized = false

func _ready():
	for letter in self.get_children():
		letter.connect("body_entered", self, "_on_Body_Entering_Letter", [letter])
	

func _on_Body_Entering_Letter(body, letter):
	if body.is_in_group("player"):
		if !display_initialized:
			for n in range(letters_in_this_level):
				body.get_node("LetterDisplay/Control/MarginContainer/HBoxContainer").add_child(Label.new())
			display_initialized = true
		body.get_node("LetterDisplay/Control/MarginContainer/HBoxContainer").get_child(letter.letter_position).text = letter.name[0]
		letter.queue_free()
		collected_letters += 1
	
	
	if collected_letters == letters_in_this_level:
		print("collected")
		emit_signal("all_letters_collected")
