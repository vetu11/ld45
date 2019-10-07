extends Node
"""
Sigleton for switching scenes.
"""

var current_scene = null
var transitioner = null

onready var Transitioner = preload("res://Transitioner/Transitioner.tscn")

func _ready() -> void:
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
	transitioner = Transitioner.instance()
	add_child(transitioner)


"""
This function will usually be called from a signal callback,
or some other function in the current scene.
Deleting the current scene at this point is
a bad idea, because it may still be executing code.
This will result in a crash or unexpected behavior.

The solution is to defer the load to a later time, when
we can be sure that no code from the current scene is running
"""
func switch(path):
    
    call_deferred("_deferred_switch", path)


func _deferred_switch(path):
	transitioner.play("black")
	yield(transitioner, "animation_finished")
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	transitioner.play_backwards("black")
