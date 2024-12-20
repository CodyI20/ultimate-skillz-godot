extends EnemyState
class_name EnemyHit

func Enter() -> void:
	print_debug("Enemy entering hit state...")
	animator.play("Hit")
	await animator.animation_finished
	state_transition.emit(self, fsm.previous_state.name)
