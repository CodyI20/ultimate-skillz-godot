extends PlayerMovementState
class_name PlayerWalk

const SPEED := 300.0

enum WALK_DIRECTION {UP, DOWN, LEFT, RIGHT}

const direction_input_map = {
	WALK_DIRECTION.UP: "Up",
	WALK_DIRECTION.DOWN: "Down",
	WALK_DIRECTION.LEFT: "Left",
	WALK_DIRECTION.RIGHT: "Right"
}

var current_walk_direction : WALK_DIRECTION

func Enter() -> void:
	print_debug("Entering walking state...")
	
func Exit() -> void:
	print_debug("Exiting walking state...")

func Physics_Update(_delta: float) -> void:
	_handle_movement()
	_update_animation()
	StateSwitchLogic()
func StateSwitchLogic() -> void:
	if Input.is_action_pressed("Left") and Input.is_action_pressed("Right") or Input.is_action_pressed("Up") and Input.is_action_pressed("Down"):
		state_transition.emit(self, "Idle")
	#if Input.is_action_pressed("Run"):
		#state_transition.emit(self, "Running")
	if !Input.is_action_pressed("Left") and !Input.is_action_pressed("Right") and !Input.is_action_pressed("Up") and !Input.is_action_pressed("Down"):
		state_transition.emit(self, "Idle")

func _handle_movement() -> void:
	var horizontal_direction := Input.get_axis("Left", "Right")
	var vertical_direction := Input.get_axis("Up", "Down")
	
	# Combine direction into a Vector2
	var movement_direction := Vector2(horizontal_direction, vertical_direction)
	
	# Normalize the direction to ensure diagonal speed is consistent
	if movement_direction != Vector2.ZERO:
		movement_direction = movement_direction.normalized()
	
	# Apply movement
	player.velocity.x = movement_direction.x * SPEED
	player.velocity.y = movement_direction.y * SPEED
	
	# Set current direction
	if vertical_direction < 0:
		current_walk_direction = WALK_DIRECTION.UP
	elif vertical_direction > 0:
		current_walk_direction = WALK_DIRECTION.DOWN
	elif horizontal_direction < 0:
		current_walk_direction = WALK_DIRECTION.LEFT
	elif horizontal_direction > 0:
		current_walk_direction = WALK_DIRECTION.RIGHT

func _update_animation() -> void:
	match current_walk_direction:
		WALK_DIRECTION.UP:
			animator.play("Walk_Up")
		WALK_DIRECTION.DOWN:
			animator.play("Walk_Down")
		WALK_DIRECTION.LEFT:
			animator.play("Walk_Sideways")
			animator.flip_h = false
		WALK_DIRECTION.RIGHT:
			animator.play("Walk_Sideways")
			animator.flip_h = true
