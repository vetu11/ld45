extends Node

onready var music_player = preload("res://WorldEnviroment/MusicPlayer.tscn")

var stream_player: AudioStreamPlayer

func _ready():
	stream_player = music_player.instance()
	self.add_child(stream_player)

var streamPos
func mute_unmute():
#	if !stream_player.stream_paused:
#		stream_player.stream_paused = true
#	else:
#		stream_player.stream_paused = false
	if stream_player.playing:
		streamPos = stream_player.get_playback_position()
		stream_player.stop()
	else:
		stream_player.play(streamPos)