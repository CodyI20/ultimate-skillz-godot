extends State
class_name PlayerState

@onready var animator: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var player: CharacterBody2D = $"../.."
@onready var movement_fsm: PlayerFSM = $".."
