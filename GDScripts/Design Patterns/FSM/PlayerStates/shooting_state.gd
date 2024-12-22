extends PlayerState
class_name PlayerShoot

var projectile : PackedScene
var source : Node2D

var can_spawn := false

func Enter():
	can_spawn = false
	animator.play("Shoot")
	await animator.animation_finished
	can_spawn = true
	state_transition.emit(self, "Idle")
	

func Exit():
	if not can_spawn:
		return
	# LOGIC FOR SHOOTING
	var new_projectile = projectile.instantiate() as Projectile
	new_projectile.global_position = body.global_position
	new_projectile.projectile_source = source
	match fsm.last_orientation:
		#fsm.PLAYER_ORIENTATION.UP:
			#new_projectile.rotation_degrees = -90
		#fsm.PLAYER_ORIENTATION.DOWN:
			#new_projectile.rotation_degrees = 90
		fsm.ORIENTATION.LEFT:
			new_projectile.rotation_degrees = 180
		fsm.ORIENTATION.RIGHT:
			new_projectile.rotation_degrees = 0
	get_tree().root.add_child(new_projectile)

	
func StateSwitchLogic():
	super()
	if Input.is_action_just_pressed("Right") or Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Down") or Input.is_action_just_pressed("Up"):
		state_transition.emit(self, "Walking")
