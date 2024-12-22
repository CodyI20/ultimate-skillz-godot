extends AudioStreamPlayer2D
class_name EnemyAudioPlayer2D

@onready var stats: Enemy = $"../Stats"
@onready var weapon: EnemyWeapon = $"../Weapon"
@onready var enemy: EnemyBrain = $".."

@export var death_sound : Array[AudioStream]
@export var hit_sound : Array[AudioStream]
@export var attack_sound : Array[AudioStream]
@export var aggro_sound : Array[AudioStream]

func _ready() -> void:
	stats.dead.connect(play_death_sound)
	stats.hit.connect(play_hit_sound)
	weapon.attack.connect(play_attack_sound)
	enemy.aggro.connect(play_aggro_sound)

func play_hit_sound() -> void:
	stream = hit_sound.pick_random()
	play()
	
func play_death_sound() -> void:
	stream = death_sound.pick_random()
	play()
	
func play_attack_sound() -> void:
	stream = attack_sound.pick_random()
	play()
	
func play_aggro_sound() -> void:
	stream = aggro_sound.pick_random()
	play()
	
