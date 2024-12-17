extends Node2D

@onready var movement_fsm: MovementFSM = $"../MovementFSM"

func _process(delta: float) -> void:
	match movement_fsm.last_orientation:
		movement_fsm.PLAYER_ORIENTATION.UP:
			rotation_degrees = 90
		movement_fsm.PLAYER_ORIENTATION.DOWN:
			rotation_degrees = -90
		movement_fsm.PLAYER_ORIENTATION.LEFT:
			rotation_degrees = 0
		movement_fsm.PLAYER_ORIENTATION.RIGHT:
			rotation_degrees = 180
