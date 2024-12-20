extends MovementState
class_name EnemyState

var initial_position : Vector2

func _ready() -> void:
	Events.enemy_died.connect(_go_to_dead_state)
	initial_position = body.global_position
	print_debug("Setting the initial position to %s" % initial_position)

func _go_to_dead_state(enemy: Enemy) -> void:
	if enemy != fsm.stats:
		return
	if fsm.current_state == self:
		state_transition.emit(self, "Dead")
