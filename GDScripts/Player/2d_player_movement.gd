extends CharacterBody2D
class_name PlayerBrain

enum PLAYER_CLASS {ARCHER, NECROMANCER, NIGHTBORNE}
@export var current_player_class : PLAYER_CLASS

signal walking
signal walking_stopped

func _physics_process(delta: float) -> void:
	move_and_slide()
