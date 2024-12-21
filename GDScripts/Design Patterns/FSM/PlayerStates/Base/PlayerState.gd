extends MovementState
class_name PlayerState


func StateInput(event: InputEvent) -> void:
	StateSwitchLogic()

func StateSwitchLogic() -> void:
	super()
	if Input.is_action_just_pressed("Roll"):
		state_transition.emit(self, "Roll")
