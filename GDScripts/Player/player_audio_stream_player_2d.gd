extends AudioStreamPlayer2D
class_name PlayerAudioStream2D

@onready var stats: Player = $"../Stats"
@onready var weapon: Weapon = $"../WeaponPivot/Weapon"
@onready var player_base: PlayerBrain = $".."


@export var death_sound : Array[AudioStream]
@export var hit_sound : Array[AudioStream]

var is_walking := false
func _ready() -> void:
	stats.dead.connect(play_death_sound)
	stats.hit.connect(play_hit_sound)

func play_hit_sound() -> void:
	stream = hit_sound.pick_random()
	play()
	
func play_death_sound() -> void:
	stream = death_sound.pick_random()
	play()
