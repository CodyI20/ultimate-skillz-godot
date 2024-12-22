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
	super()
	check_for_player_movement()
	check_for_player_attack()
