extends MovementState
class_name EnemyState

@onready var e_fsm: EnemyFSM = $"../../FSM"
@onready var area_2d: Area2D = $"../../InnerArea"
var initial_position : Vector2

func _ready() -> void:
	initial_position = body.global_position
	print_debug("Setting the initial position to %s" % initial_position)
