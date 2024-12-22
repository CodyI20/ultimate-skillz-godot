extends PlayerState
class_name PlayerWalk

@export var SPEED := 300.0

const direction_input_map = {
	#movement_fsm.PLAYER_ORIENTATION.UP: "Up",
	#movement_fsm.PLAYER_ORIENTATION.DOWN: "Down",
	fsm.ORIENTATION.LEFT: "Left",
	fsm.ORIENTATION.RIGHT: "Right"
}

func Enter() -> void:
	player_fsm.player_brain.walking.emit()

func Exit() -> void:
	player_fsm.player_brain.walking_stopped.emit()

func Physics_Update(_delta: float) -> void:
	_handle_movement()
	_update_animation()
	
func StateSwitchLogic() -> void:
	super()
	check_for_lack_of_player_movement()
	check_for_player_attack()

func _handle_movement() -> void:
	var horizontal_direction := Input.get_axis("Left", "Right")
	var vertical_direction := Input.get_axis("Up", "Down")
	
	# Combine direction into a Vector2
	var movement_direction := Vector2(horizontal_direction, vertical_direction)
	
	# Normalize the direction to ensure diagonal speed is consistent
	if movement_direction != Vector2.ZERO:
		movement_direction = movement_direction.normalized()
	
	# Apply movement
	body.velocity.x = movement_direction.x * SPEED
	body.velocity.y = movement_direction.y * SPEED
	
	# Set current direction
	#if vertical_direction < 0:
		#movement_fsm.last_orientation = movement_fsm.PLAYER_ORIENTATION.UP
	#elif vertical_direction > 0:
		#movement_fsm.last_orientation = movement_fsm.PLAYER_ORIENTATION.DOWN
	if horizontal_direction < 0:
		fsm.last_orientation = fsm.ORIENTATION.LEFT
	elif horizontal_direction > 0:
		fsm.last_orientation = fsm.ORIENTATION.RIGHT

func _update_animation() -> void:
	animator.play("Run")
	match fsm.last_orientation:
		#movement_fsm.PLAYER_ORIENTATION.UP:
			#animator.play("Walk_Up")
		#movement_fsm.PLAYER_ORIENTATION.DOWN:
			#animator.play("Walk_Down")
		fsm.ORIENTATION.LEFT:
			#animator.play("Run")
			animator.flip_h = true
		fsm.ORIENTATION.RIGHT:
			#animator.play("Run")
			animator.flip_h = false
