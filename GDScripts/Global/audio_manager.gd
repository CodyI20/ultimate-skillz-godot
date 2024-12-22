extends Node

# MUSIC
@onready var background_music: AudioStreamPlayer = $Music/BACKGROUND_MUSIC

# SFX
@onready var arrow_hit: AudioStreamPlayer = $SFX/ArrowHIT
@onready var arrow_release: AudioStreamPlayer = $SFX/ArrowRelease
@onready var bow_pullback: AudioStreamPlayer = $SFX/BowPullback
@onready var dissolve: AudioStreamPlayer = $SFX/Dissolve

# DIALOGUE
@onready var defeat: AudioStreamPlayer = $Dialogue/Defeat
@onready var victory: AudioStreamPlayer = $Dialogue/Victory
@onready var game_started : Array[AudioStreamPlayer] = [$Dialogue/GameStarted/Vo110XalatathBladeOfTheBlackEmpire25F, $Dialogue/GameStarted/Vo110XalatathBladeOfTheBlackEmpire45F, $Dialogue/GameStarted/Vo815XalatathBladeOfTheBlackEmpire03F]
func _ready() -> void:
	_event_subscription()
	if background_music.stream == null:
		printerr("THERE IS NO STREAM IN YOUR MUSIC! FIX IT! ~Also check the bus it's in while you're at it~")
		return
	
func _event_subscription() -> void:
	Events.player_range_attack.connect(bow_pullback.play)
	Events.arrow_released.connect(arrow_release.play)
	Events.finished_demo.connect(victory.play)
	Events.game_over.connect(defeat.play)
	Events.projectile_hit_something.connect(arrow_hit.play)
	Events.enemy_queue_freed.connect(dissolve.play)
	var random_game_voiceline = game_started.pick_random() as AudioStreamPlayer
	Events.game_started.connect(random_game_voiceline.play)
	random_game_voiceline.finished.connect(background_music.play)
