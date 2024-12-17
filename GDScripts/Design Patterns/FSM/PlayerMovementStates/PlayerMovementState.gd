extends State
class_name PlayerMovementState

@onready var animator: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: CharacterBody2D = $"../.."
@onready var movement_fsm: MovementFSM = $".."
