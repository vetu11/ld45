extends Node

onready var music_player = preload("res://WorldEnviroment/MusicPlayer.tscn")


func _ready():
	var stream_player = music_player.instance()
	self.add_child(stream_player)

func mute_unmute():
	pass
