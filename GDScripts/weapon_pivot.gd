extends Node2D

@onready var fsm: PlayerFSM = $"../FSM"

func _process(delta: float) -> void:
	match fsm.last_orientation:
		#movement_fsm.PLAYER_ORIENTATION.UP:
			#rotation_degrees = 90
		#movement_fsm.PLAYER_ORIENTATION.DOWN:
			#rotation_degrees = -90
		fsm.ORIENTATION.LEFT:
			rotation_degrees = 180
		fsm.ORIENTATION.RIGHT:
			rotation_degrees = 0
