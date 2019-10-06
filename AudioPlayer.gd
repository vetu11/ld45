extends Node

onready var music_player = preload("res://WorldEnviroment/MusicPlayer.tscn")

var stream_player: AudioStreamPlayer

func _ready():
#	var f = File.new()
#	f.open("user://settings.json", f.WRITE_READ)
#	var settings = parse_json(f.get_as_text())
#	f.close()
#	if typeof(settings) == TYPE_NIL:
#		settings = {}
#		settings["mute"] = false
#
	stream_player = music_player.instance()
	self.add_child(stream_player)
#
#	if settings["mute"] == false:
#		stream_player.play()


func mute_unmute():
	"""if stream_player.playing:
		stream_player.stop()
		stream_player.seek(0)
	else:
		stream_player.play()"""
	if !stream_player.stream_paused:
		stream_player.stream_paused = true
	else:
		stream_player.stream_paused = false
#	save_settings()


#func save_settings():
#	var f = File.new()
#	f.open("user://settings.json", f.WRITE_READ)
#	var settings = parse_json(f.get_as_text())
#	if typeof(settings) == TYPE_NIL:
#		settings = {}
#	settings["mute"] = stream_player.playing
#	f.seek(0)
#	f.store_string(str(settings))
#	f.close()
