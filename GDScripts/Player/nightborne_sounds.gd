extends PlayerAudioStream2D
class_name NightborneAudioStream2D

@export var attack_sounds : Array[AudioStream]

func _ready() -> void:
	super()
	Events.player_melee.connect(play_attack_sound)
	
func play_attack_sound() -> void:
	stream = attack_sounds.pick_random()
	play()
