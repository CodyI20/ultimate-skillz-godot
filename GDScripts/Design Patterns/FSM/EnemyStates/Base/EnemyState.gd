extends MovementState
class_name EnemyState

var initial_position : Vector2

func _ready() -> void:
	initial_position = body.global_position
	print_debug("Setting the initial position to %s" % initial_position)
