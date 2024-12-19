extends State
class_name PlayerState

@onready var animator: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: CharacterBody2D = $"../.."
@onready var movement_fsm: PlayerFSM = $".."

func _ready() -> void:
	Events.shooting.connect(swap_to_shooting)
	
func swap_to_shooting() -> void:
	state_transition.emit(self, "Shooting")
