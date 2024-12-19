extends PlayerState
class_name PlayerShoot

func Enter():
	print_debug("Entering shooting state...")
	animator.play("Shoot")
	await animator.animation_finished
	state_transition.emit(self, "Idle")

func Exit():
	print_debug("Exiting shooting state...")

	
func StateSwitchLogic():
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up"):
		state_transition.emit(self, "Walking")
