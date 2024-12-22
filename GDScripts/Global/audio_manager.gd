extends Node

# MUSIC
@onready var background_music: AudioStreamPlayer = $BACKGROUND_MUSIC


func _ready() -> void:
	_event_subscription()
	if background_music.stream == null:
		printerr("THERE IS NO STREAM IN YOUR MUSIC! FIX IT! ~Also check the bus it's in while you're at it~")
		return
	background_music.play()
	
func _event_subscription() -> void:
	pass
