extends MovementState
class_name PlayerState


func StateInput(event: InputEvent) -> void:
	StateSwitchLogic()

func _ready() -> void:
	Events.player_died.connect(_go_to_dead_state)

func _go_to_dead_state() -> void:
	if fsm.current_state == self:
		state_transition.emit(self, "Dead")
