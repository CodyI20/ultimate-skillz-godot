extends PlayerState
class_name PlayerRoll

@export var roll_distance := 1000.0
@export var roll_speed := 200.0

var roll_direction : Vector2

func Enter() -> void:
	animator.play("Roll")
	if fsm.last_orientation == fsm.ORIENTATION.LEFT:
		roll_direction = Vector2.LEFT
	elif fsm.last_orientation == fsm.ORIENTATION.RIGHT:
		roll_direction = Vector2.RIGHT
	await animator.animation_finished
	state_transition.emit(self, "Idle")

func Physics_Update(delta: float) -> void:
	super(delta)
	body.velocity = roll_direction * roll_speed
	
# Disable any state transitions while rolling
func StateInput(event: InputEvent) -> void:
	pass
	
