extends State
class_name MovementState

@onready var animator: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var body: CharacterBody2D = $"../.."
@onready var fsm: MovementFSM = $".."

func Physics_Update(delta: float) -> void:
	body.velocity = Vector2.ZERO

func _go_to_dead_state() -> void:
	if fsm.current_state == self:
		state_transition.emit(self, "Dead")
