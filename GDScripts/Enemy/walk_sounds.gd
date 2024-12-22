extends AudioStreamPlayer2D
class_name EnemyWalkSoundsPlayer2D

@onready var enemy: EnemyBrain = $".."
@export var walk_sound : Array[AudioStream]
var is_walking := false


func _ready() -> void:
	enemy.walking.connect(play_walk_sound)
	enemy.walking_stopped.connect(stop_walk_sound)

func play_walk_sound() -> void:
	is_walking = true
	pitch_scale = 1.5
	play_next_walk_sound()

func stop_walk_sound() -> void:
	is_walking = false
	pitch_scale = 1.0
	stop()

func play_next_walk_sound() -> void:
	if is_walking and walk_sound.size() > 0:
		stream = walk_sound.pick_random()
		play()
		await finished
		play_next_walk_sound()
	else:
		stop()
