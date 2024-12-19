extends EnemyState
class_name EnemyIdle

@export var minimum_patrol_delay_time := 2.0

func Enter():
	print_debug("Enemy entering idle state...")
	animator.play("Idle")
	await get_tree().create_timer(get_random_delay()).timeout
	state_transition.emit(self, "Patrolling")
	match fsm.last_orientation:
		fsm.ORIENTATION.LEFT:
			animator.flip_h = true
		fsm.ORIENTATION.RIGHT:
			animator.flip_h = false
func Exit():
	pass

func get_random_delay() -> float:
	var random = RandomNumberGenerator.new()
	return randf_range(minimum_patrol_delay_time, 5.0)
