extends PlayerState
class_name PlayerIdle

func Enter():
	animator.play("Idle")
	match fsm.last_orientation:
		#movement_fsm.PLAYER_ORIENTATION.UP:
			#animator.play("Idle_Up")
		#movement_fsm.PLAYER_ORIENTATION.DOWN:
			#animator.play("Idle_Down")
		fsm.ORIENTATION.LEFT:
			#animator.play("Idle")
			animator.flip_h = true
		fsm.ORIENTATION.RIGHT:
			#animator.play("Idle")
			animator.flip_h = false
func Exit():
	pass
	
func StateSwitchLogic():
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up") or Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")
	if Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")
	if Input.is_action_just_pressed("Attack"):
		state_transition.emit(self, "Shooting")
