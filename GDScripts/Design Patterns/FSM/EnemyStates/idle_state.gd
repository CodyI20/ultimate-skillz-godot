extends EnemyState
class_name EnemyIdle

func Enter():
	print_debug("Entering idle state...")
	animator.play("Idle")
	match fsm.last_orientation:
		fsm.ORIENTATION.LEFT:
			animator.flip_h = true
		fsm.ORIENTATION.RIGHT:
			animator.flip_h = false
func Exit():
	print_debug("Exiting idle state...")
	
func StateSwitchLogic():
	if Input.is_action_pressed("Right") or Input.is_action_pressed("Left") or Input.is_action_pressed("Down") or Input.is_action_pressed("Up"):
		state_transition.emit(self, "Walking")
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up") or Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit(self, "Shooting")
