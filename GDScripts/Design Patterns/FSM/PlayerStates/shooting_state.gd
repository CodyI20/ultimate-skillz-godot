extends PlayerState
class_name PlayerShoot

func Enter():
	animator.play("Shoot")
	await animator.animation_finished
	state_transition.emit(self, "Idle")

func Exit():
	pass

	
func StateSwitchLogic():
	super()
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up"):
		state_transition.emit(self, "Walking")
