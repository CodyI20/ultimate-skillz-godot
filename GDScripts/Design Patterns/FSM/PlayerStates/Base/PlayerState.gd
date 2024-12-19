extends MovementState
class_name PlayerState

func _ready() -> void:
	Events.player_died.connect(_go_to_dead_state)
