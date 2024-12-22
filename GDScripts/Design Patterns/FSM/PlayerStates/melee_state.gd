extends PlayerState
class_name PlayerMelee

@onready var weapon: Weapon = $"../../WeaponPivot/Weapon"
@export var SPEED := 150

var can_swap_states := false
func Enter() -> void:
	can_swap_states = false
	animator.play("Attack")
	await animator.animation_finished
	Events.player_melee_anim_finished.emit()
	can_swap_states = true

func Physics_Update(_delta: float) -> void:
	_handle_movement()
	_update_orientation()
	
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
	
	if horizontal_direction < 0:
		fsm.last_orientation = fsm.ORIENTATION.LEFT
	elif horizontal_direction > 0:
		fsm.last_orientation = fsm.ORIENTATION.RIGHT

func _update_orientation() -> void:
	match fsm.last_orientation:
		fsm.ORIENTATION.LEFT:
			animator.flip_h = true
		fsm.ORIENTATION.RIGHT:
			animator.flip_h = false

func StateSwitchLogic() -> void:
	super()
	if can_swap_states:
		if Input.is_action_pressed("Left") or Input.is_action_pressed("Right") or Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
			state_transition.emit(self, "Walking")
		check_for_lack_of_player_movement()
		check_for_player_movement()
