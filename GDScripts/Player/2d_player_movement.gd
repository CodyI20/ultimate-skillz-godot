extends CharacterBody2D
class_name PlayerBrain

enum PLAYER_CLASS {ARCHER, NECROMANCER, NIGHTBORNE}
@export var current_player_class : PLAYER_CLASS

signal walking
signal walking_stopped

func _ready() -> void:
	Events.player_died.connect(stop_movement)
	
func stop_movement() -> void:
	velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_and_slide()
