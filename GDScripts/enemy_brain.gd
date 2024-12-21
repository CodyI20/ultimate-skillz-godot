extends CharacterBody2D
class_name EnemyBrain

@onready var fsm: EnemyFSM = $FSM

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Events.start_chasing_player.emit(fsm, body)
