extends PlayerState
class_name PlayerShoot

func Enter():
	animator.play("Shoot")
	await animator.animation_finished
	state_transition.emit(self, "Idle")
	print_debug("Entering shooting state...")
func Exit():
	print_debug("Exiting shooting state...")
func Update(_delta: float):
	StateSwitchLogic()
func Physics_Update(_delta: float):
	pass
	
func StateSwitchLogic():
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up") or Input.is_action_just_released("Down") or Input.is_action_just_released("Up") or Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		state_transition.emit(self, "Walking")