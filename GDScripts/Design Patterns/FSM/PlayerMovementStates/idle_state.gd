extends PlayerMovementState
class_name PlayerIdle

func Enter():
	match movement_fsm.last_orientation:
		movement_fsm.PLAYER_ORIENTATION.UP:
			animator.play("Idle_Up")
		movement_fsm.PLAYER_ORIENTATION.DOWN:
			animator.play("Idle_Down")
		movement_fsm.PLAYER_ORIENTATION.LEFT:
			animator.play("Idle_Sideways")
			animator.flip_h = false
		movement_fsm.PLAYER_ORIENTATION.RIGHT:
			animator.play("Idle_Sideways")
			animator.flip_h = true
	print_debug("Entering idle state...")
func Exit():
	print_debug("Exiting idle state...")
func Update(_delta: float):
	StateSwitchLogic()
func Physics_Update(_delta: float):
	pass
	
func StateSwitchLogic():
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up") or Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")
